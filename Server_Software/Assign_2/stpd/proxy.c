#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <fcntl.h>
#include <limits.h>
#include <pthread.h>
#include <errno.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <time.h>
#include <sys/time.h>
#include <sys/poll.h>
#include <signal.h>
#include "utils.h"

#define MAX_HEADER     20480
#define MAX_LINE        2560
#define MAX_COMMAND    10240
#define MAX_FILE_NAME   2560
#define MAX_FILE_LEN   81920
#define GET 0
#define POST 1
#define BSIZ   8192
#define TEST_PORT	9999
#define MAX_REQ		500

char buffer[BSIZ];
int MAX_CONN = 1;		//starting number of connections
pthread_mutex_t mCtrl;
pthread_cond_t new, shared;

char *methods[2] = { "GET", "POST" };

struct reqarg {
    int client;
    char reqline[MAX_LINE];
    char reqhead[MAX_HEADER];
};

typedef struct reqarg reqarg_t;

/*
** Structure to contain a connections details
*/
typedef struct connarg {
    int requestNo;		//keeps track of the total number of requests made on this connection
    char hostName[MAX_LINE];	//host 
    int portNo;			//port
    int cID;			//connection ID
    int clientReq[MAX_REQ];	//Look up table - indexes are the request ID, and the elements are the client ID - i.e. which request is for which client
    pthread_mutex_t m;
} connections;

connections *conArray;

char *sservHost;		//Store the server proxy host
int sservPort;			//Store the server proxy port


/*
** Function to initialise all requestNo's in connection list to -1 to indicate connection not in use
*/
void initialiseConnectionArray()
{
    int i = 0;
    for (i = 0; i < MAX_CONN; i++) {
	conArray[i].requestNo = -1;
    }
}

/*
** Function to set up a new connection
*/
void createConnection(int pos, int count, char *h, int p, int clientID,
		      int s)
{
    conArray[pos].requestNo = count;
    strcpy(conArray[pos].hostName, h);
    conArray[pos].portNo = p;
    conArray[pos].cID = s;
    conArray[pos].clientReq[count] = clientID;
    pthread_mutex_init(&conArray[pos].m, NULL);
}

int contentlength(char *header)
{
    int len = INT_MAX;
    char line[MAX_LINE];

    if (HTTPheadervalue_case(header, "Content-Length", line)) {
	sscanf(line, "%d", &len);
    }
    return len;
}

void parserequest(char *request, int *method, char *host, int *portno,
		  char *path, char *prot)
{
    char url[MAX_FILE_NAME] = "";
    char m[MAX_FILE_NAME] = "";
    char hostport[MAX_FILE_NAME] = "";
    char port[MAX_FILE_NAME] = "";

    sscanf(request, "%[^ ] %[^ ] HTTP/%[^ \r\n]", m, url, prot);
    if (strcmp(m, "GET") == 0) {
	*method = GET;
    } else if (strcmp(m, "POST") == 0) {
	*method = POST;
    }
    sscanf(url, "http://%[^\n\r/]%[^\n\r]", hostport, path);
    sscanf(hostport, "%[^:]:%[^\n\r]", host, port);
    if (*port == '\0') {
	*portno = 80;
    } else {
	*portno = atoi(port);
    }
}

int parseresponse(char *statusline)
{
    int i;

    sscanf(statusline, "HTTP/1.1 %d ", &i);
    return i;
}

int compareString(char *first, char *second)
{
    while (*first == *second) {
	if (*first == '\0' || *second == '\0')
	    break;

	first++;
	second++;
    }
    if (*first == '\0' && *second == '\0')
	return 1;
    else
	return 0;
}

void *request(void *a)
{
    char reqhead1[MAX_HEADER];
    char reshead[MAX_HEADER];
    char resline[MAX_LINE];
    char resid[MAX_LINE];		//response ID
    char host[MAX_FILE_NAME];
    char path[MAX_FILE_NAME];
    char prot[MAX_FILE_NAME];
    char tbuff[BSIZ];
    int server, i, portno, method, status;
    int n, rlen, tlen, clen;
    unsigned int chlen;
    reqarg_t *arg = (reqarg_t *) a;
    int client = arg->client;
    char *reqline = arg->reqline;
    char *reqhead = arg->reqhead;
    int k = 0, test = 0, matchFound = 0;		//k = counter, test and matchFound act as bools
    connections *temp;					//temporary to allow for realloc of memory on conArray
    struct timespec ts;	
    struct timeval now;
    int rt;
    long int resIDint; 					//stores response ID as a long int

    parserequest(reqline, &method, host, &portno, path, prot);
    sprintf(reqhead1, "%s", reqline);
    HTTPheaderremove_case(reqhead, "connection");
    strcat(reqhead1, "Connection: keep alive\r\n");	//Response ID doesn't increment with this included
    strcat(reqhead1, reqhead);

    while (1) {
	//Only test if the connection exists or not on the first run of this loop       
	if (!test) {

	    //if the connection list is not empty then test for matching connections
	    if (conArray[0].requestNo != -1) {

		printf("Checking existing connections...\n");
		//Some connections exist, so see if they match the host:port for the request
		for (k = 0; k < MAX_CONN; k++) {

		    if (compareString(conArray[k].hostName, host)
			&& conArray[k].portNo == portno) {
			
			gettimeofday(&now, NULL);

			ts.tv_sec = now.tv_sec + 5;
			ts.tv_nsec = (now.tv_usec + 1000UL * 1000) * 1000UL;
			
			pthread_mutex_lock(&conArray[k].m);
			rt = pthread_cond_timedwait(&shared, &conArray[k].m, &ts);
			printf("Existing connection found.\n");

			//if it exists
			//increment the request counter
			conArray[k].requestNo++;

			//save the clients ID with the request ID
			conArray[k].clientReq[conArray[k].requestNo] =
			    client;

			//use the details of the connection from the saved info
			server = conArray[k].cID;
			printf("RequestNo: %d, Client: %d\n",
			       conArray[k].requestNo, client);
			matchFound = 1;
			pthread_mutex_unlock(&conArray[k].m);
			pthread_cond_broadcast(&shared);
			break;
		    }

		}
			pthread_mutex_unlock(&conArray[k].m);

	    } else {		//Initialise
		gettimeofday(&now, NULL);

		ts.tv_sec = now.tv_sec + 5;
		ts.tv_nsec = (now.tv_usec + 1000UL * 1000) * 1000UL;
		//if there are no existing connections, then create a new one         
		printf("No existing connections found.\n");
		if ((server = activesocket(sservHost, sservPort)) < 0) {
		   // printf("Failing this test.\n");
		    sleep(1);
		    continue;
		}
		pthread_mutex_trylock(&mCtrl);
		rt = pthread_cond_timedwait(&new, &mCtrl, &ts);

		//if another connection has been made whilst waiting
		if (conArray[0].requestNo != -1)
		    continue;
		//create a new connection in first empty position of array if it doesn't exist

		printf("Creating new connection...\n");
		createConnection(0, 0, host, portno, client, server);
		printf("RequestID: %d\n", conArray[0].requestNo);

		matchFound = 1;
		pthread_mutex_unlock(&mCtrl);
		pthread_cond_broadcast(&new);
	    }


	    if (!matchFound) {
		printf("No matching connections found.\n");
		gettimeofday(&now, NULL);

		ts.tv_sec = now.tv_sec + 5;
		ts.tv_nsec = (now.tv_usec + 1000UL * 1000) * 1000UL;
//if no matching connection has been found, or there are no existing connections, then create a new one         
		if ((server = activesocket(sservHost, sservPort)) < 0) {
		    sleep(1);
		    continue;
		}

		//Determine the next available position in the array
		for (k = 0; k < MAX_CONN; k++) {
		    if (conArray[k].requestNo == -1) {
			break;
		    }
		}
		
		pthread_mutex_trylock(&mCtrl);
		rt = pthread_cond_timedwait(&new, &mCtrl, &ts);
		//if we reach the end of the array, increase the size of the array
		if (k == MAX_CONN) {
		    MAX_CONN++;
		    printf("Total Connections: %d\n", MAX_CONN);
		    temp = realloc(conArray, (MAX_CONN) * sizeof(connections));	/* give the pointer some memory */

		    //make sure memory has been allocated
		    if (temp != NULL) {
			conArray = temp;

		    } else {
			free(conArray);
			printf("Error allocating memory!\n");
			exit(1);
		    }


		}
		//create a new connection in first empty position of array if it doesn't exist
		printf("Creating new connection...\n");
		createConnection(k, 0, host, portno, client, server);
		printf("RequestID: %d\n", conArray[k].requestNo);
		pthread_mutex_unlock(&mCtrl);
		pthread_cond_broadcast(&new);
	    }
	    test = 1;
	}
	
	gettimeofday(&now, NULL);

			ts.tv_sec = now.tv_sec + 5;
			ts.tv_nsec = (now.tv_usec + 1000UL * 1000) * 1000UL;
	pthread_mutex_lock(&conArray[k].m);
	rt = pthread_cond_timedwait(&shared, &conArray[k].m, &ts);
	
	n = strlen(reqhead1);

	if (write(server, reqhead1, n) < n) {
	    close(server);
	    continue;
	}

	if (method == POST) {
	    rlen = contentlength(reqhead);
	    i = 0;
	    n = 0;
	    while (rlen > 0) {
		tlen = BSIZ;
		if (rlen < tlen) {
		    tlen = rlen;
		}
		n = read(client, tbuff, tlen);
		if (n <= 0)
		    break;
		i = write(server, tbuff, n);
		if (i < n)
		    break;
		rlen -= n;
	    }
	    if (n <= 0 || i < n) {
		close(server);
		continue;
	    }
	}
	
	//if any of the following tests fail, make sure we unlock the mutex!
	
	//get response ID
	if (TCPreadline(server, resid, MAX_LINE) == 0) {
	    close(server);
	    pthread_mutex_unlock(&conArray[k].m);
	    pthread_cond_broadcast(&shared);
	    continue;
	}

	if (TCPreadline(server, resline, MAX_LINE) == 0) {
	    close(server);
	    pthread_mutex_unlock(&conArray[k].m);
	    pthread_cond_broadcast(&shared);
	    continue;
	}

	if (HTTPreadheader(server, reshead, MAX_HEADER) == 0) {
	    close(server);
	    pthread_mutex_unlock(&conArray[k].m);
	    pthread_cond_broadcast(&shared);
	    continue;
	}
	pthread_mutex_unlock(&conArray[k].m);
	pthread_cond_broadcast(&shared);
	break;
    }

    printf("Response ID: %s\n", resid);
   char *ptr;

    //since resID is in Hex...
   resIDint = strtol(resid, &ptr, 16);

    printf("Client ID for response %ld is %d\n", resIDint,
	   conArray[k].clientReq[resIDint]);
    //Find the client ID that corresponds to the response ID
    client = conArray[k].clientReq[resIDint];

    write(client, resline, strlen(resline));
    HTTPheaderremove_case(reshead, "connection");
    write(client, reshead, strlen(reshead));

    if (HTTPheadervalue_case(reshead, "Transfer-Encoding", resline)
	&& strcasecmp(resline, "chunked") == 0) {
	while (1) {
	
	    //retrieve respones ID from chunk
	    TCPreadline(server, resid, MAX_LINE);
	
	    TCPreadline(server, resline, MAX_LINE);
	    write(client, resline, strlen(resline));
	    sscanf(resline, "%x", &chlen);
	    if (chlen == 0)
		break;
	    while (chlen > 0) {
		tlen = BSIZ;
		if (chlen < tlen) {
		    tlen = chlen;
		}
		n = read(server, tbuff, tlen);
		chlen -= n;
		i = write(client, tbuff, n);
	    }
	    read(server, tbuff, 1);
	    if (*tbuff != '\r')
		printf("Error %d\n", *tbuff);
	    read(server, tbuff, 1);
	    if (*tbuff != '\n')
		printf("Error %d\n", *tbuff);
	    write(client, "\r\n", 2);
	}
	read(server, tbuff, 1);
	if (*tbuff != '\r')
	    printf("Error %d\n", *tbuff);
	read(server, tbuff, 1);
	if (*tbuff != '\n')
	    printf("Error %d\n", *tbuff);
	write(client, "\r\n", 2);
    } else {
	status = parseresponse(resline);
	if (status != 204 && status != 304) {
	    clen = contentlength(reshead);
	    while (clen > 0) {
		tlen = BSIZ;
		if (clen < tlen) {
		    tlen = clen;
		}
		n = read(server, tbuff, tlen);
		if (n <= 0)
		    break;
		i = write(client, tbuff, n);
		if (i < n)
		    break;
		clen -= n;
	    }
	    if (n <= 0 || i < n) {
		close(server);
	    }
	}
    }
    return NULL;
}

void *connection(void *a)
{
    char temp[MAX_FILE_NAME];
    reqarg_t *arg;
    int client = *(int *) a;

    do {
	arg = (reqarg_t *) malloc(sizeof(reqarg_t));
	arg->client = client;
	if (TCPreadline(client, arg->reqline, MAX_LINE) == 0) {
	    break;
	}
	HTTPreadheader(client, arg->reqhead, MAX_HEADER);
	request(arg);
    } while (!HTTPheadervalue_case(arg->reqhead, "connection", temp)
	     || strcasecmp(temp, "close") != 0);
    close(client);
    return NULL;
}



int main(int argc, char *argv[])
{
    int port, serversocket;
    int *arg;
    pthread_t t;

    sigignore(SIGPIPE);
    port = atoi(argv[1]);

    pthread_mutex_init(&mCtrl, NULL);
    pthread_cond_init(&new, NULL);
    pthread_cond_init(&shared, NULL);
    
    //Store host and port for server proxy
    sservHost = argv[3];
    sservPort = atoi(argv[4]);

    conArray = malloc(MAX_CONN * sizeof(connections));

    printf("**port %d\n", port);
    if ((serversocket = passivesocket(port)) < 0) {
	perror("open");
	exit(1);
    }
    
    initialiseConnectionArray();
    
    while (1) {
	arg = (int *) malloc(sizeof(int));
	*arg = acceptconnection(serversocket);
	pthread_create(&t, NULL, connection, arg);
    }
    free(conArray);
    return 0;
}
