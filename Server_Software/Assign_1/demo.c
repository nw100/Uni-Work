/* Skeleton program for project marking problem, COMSM2001 Assignment 1 */
/**************************
** Author: Nina Williams **
*** Candidate No: 64476 ***
***************************/

#include <stdlib.h>
#include <stdio.h>
#include <pthread.h>
#include <time.h>
#include <sys/time.h>


#define NMAR 100		/*Max no. of markers allowed */
#define NSTU 100		/*Max no. of students allowed */

int S;				/* Number of students */
int M;				/* Number of markers */
int K;				/* Number of markers per demo */
int N;				/* Number of demos per marker */
int T;				/* Length of session (minutes) */
int D;				/* Length of demo (minutes) */
	 /* S*K <= M*N */
	 /* D <= T */

int count;			/*Total number of markers available/idle */
int sCount;
int mCount;

int markerState[NMAR];		/*Records the state of the marker. 0 is idle, 1 is busy */
int demoState[NSTU];		/*Records whether or not a student is in a demo, 0 is not in a demo, 1 is in a demo */
int stuMark[NMAR];		/*Global variable to keep track of which markers a student is showing their demo to */
int totalMarkers[NSTU];		/*Total number of markers a student has grabbed */

/*Mutex*/
static pthread_mutex_t m;

/*Condition*/
pthread_cond_t CV;

struct timeval starttime;

/* timenow(): returns current simulated time in "minutes" (cs) */
int timenow()
{
    struct timeval now;
    gettimeofday(&now, NULL);
    return (now.tv_sec - starttime.tv_sec) * 100 + (now.tv_usec -
						    starttime.tv_usec) /
	10000;
}

/* delay(t): delays for t "minutes" (cs) */
void delay(int t)
{
    struct timespec rqtp, rmtp;
    t *= 10;
    rqtp.tv_sec = t / 1000;
    rqtp.tv_nsec = 1000000 * (t % 1000);
    nanosleep(&rqtp, &rmtp);
}

/* panic(): simulates a student's panicking activity */
void panic()
{
    delay(random() % (T - D));
}

/* demo(): simulates a demo activity */
void demo()
{
    delay(D);
}

/*grabber_wait(): locks markerGrab*/
void lock()
{
    pthread_mutex_lock(&m);
}

/*grabber_wait(): unlocks markerGrab*/
void unlock()
{
    pthread_mutex_unlock(&m);
}

/* marker(arg): marker thread */
void *marker(void *arg)
{
    int markerID = *(int *) arg;
    int job, studentID;

    printf("%d marker %d: enters lab\n", timenow(), markerID);

    for (job = 0; job < N; job++) {
	if (timenow() >= T - D || sCount == S) {	/* If there is still enough time for a demo */
	    break;
	} else {

	    /*Wait to be grabbed by a student */
	    lock();
	    while (markerState[markerID] == 0) {
		pthread_cond_wait(&CV, &m);
	    }
	    studentID = stuMark[markerID];	/*Set studentID */
	    unlock();

	    printf("%d marker %d: grabbed by student %d (job %d)\n",
		   timenow(), markerID, studentID, job + 1);
		   
		

	    /*Wait for the demo to begin */
	    lock();
	    while (demoState[studentID] == 0) {
		pthread_cond_wait(&CV, &m);
	    }
	    
	    

	    while (demoState[studentID] == 1) {
		pthread_cond_wait(&CV, &m);
	    }

	    printf("%d marker %d: finished with student %d (job %d)\n",
		   timenow(), markerID, studentID, job + 1);
	    unlock();

	    /*Increment count and set markers state to idle */
	    lock();
	    markerState[markerID] = 0;
	    count++;
	    pthread_cond_broadcast(&CV);
	    unlock();
	}
    }

    markerState[markerID] = -1;	/*Set markerState to show that the marker is no longer available */
    count--;			/*Decrement count because this marker no longer 'counts' */
    if (job == N) {
	printf("%d marker %d: exits lab (finished %d jobs)\n", timenow(),
	       markerID, N);
    } else if(sCount == S){
    	printf("%d marker %d: exits lab (no more demos needed)\n", timenow(), markerID);
    } else {
	printf("%d marker %d: exits lab (timeout)\n", timenow(), markerID);

    }
	mCount--;
    return NULL;
}

/* student(arg): student thread */
void *student(void *arg)
{
    int studentID = *(int *) arg;
    int j;

    printf("%d student %d: starts panicking\n", timenow(), studentID);

    panic();

    printf("%d student %d: enters lab\n", timenow(), studentID);

    if (timenow() >= T - D || mCount < K) {	/* If there isn't enough time to perform a demo */
	printf("%d student %d: exits lab (timeout)\n", timenow(),
	       studentID);
    }

    else {

	/*Grab the markers */
	lock();

	/*Wait for enough markers to be idle */
	while (count < K) {
	    pthread_cond_wait(&CV, &m);
	    if(mCount < K){
	 	 	printf("%d student %d: exits lab (no more markers)\n", timenow(),
	       studentID);
		unlock();
	       break;  
	}
	}
	unlock();

	/*When enough markers are free, grab them! */
	lock();
	for (j = 0; j < M; j++) {
	    /*Only grab idle markers */
	    if (markerState[j] == 0) {	/*0 is idle */
		stuMark[j] = studentID;	/*Lets the marker know which student it is */
		markerState[j] = 1;	/*Sets the markers state to 1 -> busy */
		count--;
		totalMarkers[studentID]++;
		pthread_cond_broadcast(&CV);
	    }
	    if (totalMarkers[studentID] == K)
		break;
	}

	unlock();

/*Lock the demo mutex*/
	lock();

	printf("%d student %d: starts demo\n", timenow(), studentID);
	demoState[studentID] = 1;
	pthread_cond_broadcast(&CV);
	unlock();


	demo();
	/*Lock */
	lock();
	/*Do stuff */
	printf("%d student %d: ends demo\n", timenow(), studentID);
	demoState[studentID] = 0;

	pthread_cond_broadcast(&CV);

/*Unlock*/
	unlock();
	printf("%d student %d: exits lab (finished)\n", timenow(),
	       studentID);



    }
	sCount++;
    return NULL;
}


int main(int argc, char *argv[])
{
    int i;
    int markerID[NMAR], studentID[NSTU];
    pthread_t markerT[NMAR], studentT[NSTU];
    /*Marker initialise waits */
    pthread_cond_init(&CV, NULL);

    if (argc < 6) {
	printf("Usage: demo S M K N T D\n");
	exit(1);
    }
    S = atoi(argv[1]);
    M = atoi(argv[2]);
    K = atoi(argv[3]);
    N = atoi(argv[4]);
    T = atoi(argv[5]);
    D = atoi(argv[6]);
    if (M > NMAR || S > NSTU) {
	printf("Maximum %d markers and %d students allowed\n", NMAR, NSTU);
	exit(1);
    }

    if (!(S * K <= M * N)) {
	printf("Inputs don't match criteria.\n");
	exit(1);
    }

    printf("S=%d M=%d K=%d N=%d T=%d D=%d\n", S, M, K, N, T, D);
    /*Initialise mutexes */
    pthread_mutex_init(&m, NULL);

    /*Initialise demoComplete */
    for (i = 0; i < S; i++) {
	markerState[i] = 0;
	demoState[i] = 0;
	stuMark[i] = NMAR + 1;	/*Initialise to a value that isn't going to be the ID of a thread */
	totalMarkers[i] = 0;

    }
    count = M;
    sCount = 0;
    mCount = M;


    gettimeofday(&starttime, NULL);	/* Save start of simulated time */

    /* Create S student threads */
    for (i = 0; i < S; i++) {
	studentID[i] = i;
	pthread_create(&studentT[i], NULL, student, &studentID[i]);
    }
    /* Create M marker threads */
    for (i = 0; i < M; i++) {
	markerID[i] = i;
	pthread_create(&markerT[i], NULL, marker, &markerID[i]);
    }
    delay(T - D);		/* Wait until latest time demo can start */
    /* MIGHT DO SOMETHING AT THIS TIME */

    
    /* Wait for student threads to finish */
    for (i = 0; i < S; i++) {
	pthread_join(studentT[i], NULL);
	if(timenow() >= T){
		break;
	}
    }   

if(sCount == S){
	printf("Students have finished their demos.\n");
}

if(timenow() < T){
delay(T-timenow());
}


        printf("%d That's all!\n", timenow());
    return 0;
}