/*Hailstones Week 3*/
/*Nina Williams P 1336048*/

#include<stdio.h>

/* Total is to keep track of the largest number you wish to test up to for each sequence*/
#define TOTAL 50000 
#define even 2


int main(void)
{
/**
** init is the starting number for the hailstone sequence
**
** seqCount : longest sequence
** tempCount : length of each sequence 
** initCount : which starting number produces the longest sequence
** largeNo : largest overall number
** tempLarge : largest number of each sequence
** initLarge : which starting number produces the largest number
*/
    int init, seqCount = 0, tempCount = 0, initCount, largeNo =
	0, tempLarge = 0, initLarge;

    for (int n = 2; n < TOTAL; n++) {

	init = n;

	while (init > 1) {

	//even or odd?
	    if (init % even == 0) {
		init /= 2;
	    }
	    else {
		init = (3 * init) + 1;
	    }

	    tempLarge = init;

	    if (tempLarge > largeNo) {
			largeNo = tempLarge;
			initLarge = n;
	    }

	    tempCount++;
	}


	if (tempCount > seqCount) {
	    seqCount = tempCount;
	    initCount = n;
	}

/*reset tempCount to count the next sequence */
	tempCount = 0;
    }

    printf("Longest sequence is : %d\n", seqCount);
    printf("When initial number is : %d\n", initCount);
    printf("Largest number is : %d\n", largeNo);
    printf("When initial number is : %d\n",
	   initLarge);


    return 0;
}
