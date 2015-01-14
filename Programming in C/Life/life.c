#include <stdio.h>
#include <stdlib.h>
#include "neillsdl2.h"

#define MAX 2500
#define MAX_BOARD 50
#define RECTSIZE 20
#define MILLISECONDDELAY 200

void generateBoard(FILE * fp, char board[][MAX_BOARD], int rows, int cols);
void generationStep(char board[][MAX_BOARD], int rows, int cols);
int countNeighbours(char board[][MAX_BOARD], int i, int j);

int main(int argc, char *argv[])
{
    SDL_Simplewin sw;
    SDL_Rect rectangle;
    rectangle.w = RECTSIZE;
    rectangle.h = RECTSIZE;

    Neill_SDL_Init(&sw);

    FILE *fp;
    int ROWS, COLS;
    char grid[MAX_BOARD][MAX_BOARD];	/*create a board with maximum size of 50*50 */

    if ((fp = fopen(argv[1], "r")) == NULL) {	/*open file with test - read only*/
	printf("Cannot open file\n");
	return 1;
    }

    if (fscanf(fp, "%d %d", &ROWS, &COLS) != 2) {	/*initialise ROWS and COLS from file values */
	printf("Error with scanning rows/cols");
    }

    generateBoard(fp, grid, ROWS, COLS);	/*board setup using file info */

//**CODE FOR TEXT BASED VERSION**/ 
//    printf("\nGeneration 1: ");
/*
    for (int i = 0; i < ROWS; i++) {	//printf the first board to show initial state 
	for (int j = 0; j < COLS; j++) {
	    printf("%c", grid[i][j]);
	}
	printf("\n");
    }

    //keep looping until the user quits 
    while (1) {
	printf("Press ENTER to continue: ");
	char c = getchar();
	if (c == '\n' || c == EOF)
	    generationStep(grid, ROWS, COLS);	//create a new generation 
	for (int i = 0; i < ROWS; i++) {	//print the new generation 
	    for (int j = 0; j < COLS; j++) {
		printf("%c", grid[i][j]);
	    }
	    printf("\n");
	}

    }*/

/*display board using SDL*/
    do {
	SDL_Delay(MILLISECONDDELAY);	//slow the rate of display to show each generation

	for (int i = 0; i < ROWS; i++) {
	    for (int j = 0; j < COLS; j++) {
		if (grid[i][j] == '#') {	/*alive cells */
		    Neill_SDL_SetDrawColour(&sw, 220, 20, 60);	/*crimson colour */
		    rectangle.x = i * (rectangle.h);
		    rectangle.y = j * (rectangle.w);
		    SDL_RenderFillRect(sw.renderer, &rectangle);
		} else if (grid[i][j] == '-') {	/*dead cells */
		    Neill_SDL_SetDrawColour(&sw, 255, 250, 240);	/*off-white */
		    rectangle.x = i * (rectangle.h);
		    rectangle.y = j * (rectangle.w);
		    SDL_RenderFillRect(sw.renderer, &rectangle);	/*refill rect to whiteish colour */
		    Neill_SDL_SetDrawColour(&sw, 41, 36, 33);	/*brown */
		    SDL_RenderDrawRect(sw.renderer, &rectangle);	/*outline rect to show grid pattern */
		}
	    }
	}
	SDL_RenderPresent(sw.renderer);
	SDL_UpdateWindowSurface(sw.win);

	generationStep(grid, ROWS, COLS);	/*update board info */

	Neill_SDL_Events(&sw);
    } while (!sw.finished);

/*Clear up graphics subsystems*/
    atexit(SDL_Quit);
    fclose(fp);

    return 0;
}

/**
** pass the file info, the board, and the size of the board to generateBoard
** uses the above information to set the values of the board equal to the info in the file	
**/

void generateBoard(FILE * fp, char board[][MAX_BOARD], int rows, int cols)
{
    char temp[MAX];		/*temporary array to read file */
    int ch, x = 0, k = 0;	/*char reader, and two counters */

    /*read file values and store them in temp */
    do {
	ch = fgetc(fp);

	if ((ch != '\n') && (ch == '-' || ch == '#')) {
	    temp[x] = (char) ch;
	    x++;		/*only increase counter if temp has successfully got a value */
	}

    } while (ch != EOF);


    for (int i = 0; i < rows; i++) {	/*now store info into the 2D array */
	for (int j = 0; j < cols; j++) {
	    board[i][j] = temp[k];
	    k++;
	}
    }

}

/**
** generationStep uses the info from board and the size of board
** has the main logic of the game
** uses a different array - changeBoard - to record any changes in the board - moves must happen 
** simultaneously. At the end of the function the board is updated with info from changeBoard
**/

void generationStep(char board[][MAX_BOARD], int rows, int cols)
{
    int neighbourCount, changeBoard[rows][cols];

    for (int i = 0; i < rows; i++) {
	for (int j = 0; j < cols; j++) {
	    changeBoard[i][j] = 2;	/*initialise to something that isn 't 1 or 0 */
	}
    }

    for (int i = 0; i < rows; i++) {
	for (int j = 0; j < cols; j++) {

	    neighbourCount = countNeighbours(board, i, j);	/*count how many neighbours the current cell has */

	    if (board[i][j] == '#') {	/*if the cell is inhabited */

		if (neighbourCount == 2 || neighbourCount == 3) {	/*survival */
		    /*do nothing; the cell lives */
		} else if (neighbourCount < 2 || neighbourCount > 3) {	/*death */
		    changeBoard[i][j] = 0;
		}

	    } else {		/*if the cell is uninhabited */

		if (neighbourCount == 3) {	/*birth */
		    changeBoard[i][j] = 1;	/*record a change in state */
		}

	    }

	    neighbourCount = 0;	/*reset neighbourCount (not necessary but just as a precaution) */

	}
    }


    for (int i = 0; i < rows; i++) {	/*update board using info from changeBoard */
	for (int j = 0; j < cols; j++) {

	    if (changeBoard[i][j] == 0) {
/*if the state of the cell is 0, mark the corresponding cell as dead*/
		board[i][j] = '-';

	    } else if (changeBoard[i][j] == 1) {
/*if the state of the cell is 1, mark the corresponding cell as alive*/
		board[i][j] = '#';
	    }
	}
    }


}

/**
** Function to count each of the neighbours NSEW + diagonals
** returns an integer count
**/

int countNeighbours(char board[][MAX_BOARD], int i, int j)
{
    int count = 0;

    for (int a = i - 1; a <= i + 1; a++) {
	for (int b = j - 1; b <= j + 1; b++) {
	    if (a > MAX || a < 0 || b < 0 || b > MAX) {	//cells outside boundary are dead
		//do nothing
		//outside boundary              
	    } else if (a == i && b == j) {
		//do nothing
		//central square
	    } else {
		if (board[a][b] == '#') {
		    count++;
		}
	    }
	}
    }
    return count;
}
