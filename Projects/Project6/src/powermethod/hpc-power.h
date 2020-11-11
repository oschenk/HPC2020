/*
 *  hpc0power.h
 *
 * WE WILL OVERWRITE YOUR COPY OF THIS FILE WITH MY OWN. ANY CHANGES YOU MAKE WILL NOT BE VISIBLE DURING GRADING.
 *
 */

#ifdef GETTIMEOFDAY
  #include <sys/time.h> // For struct timeval, gettimeofday
#else
  #include <time.h> // For struct timespec, clock_gettime, CLOCK_MONOTONIC
#endif
# include <stdio.h>


/*
Generates a slice of matrix A.
In grading I may use several different versions of this function to test your code.

arguments:
  n = the number of columns (and rows) in A
  startrow = the row to start on
  numrows = the number of rows to generate

return value:
  a slice of matrix A in row major order for a 2x2 matrix (in C notation):
  A[index] => A(row, column)
  A[0] => A(0, 0)
  A[1] => A(0, 1)
  A[2] => A(1, 0)
  A[3] => A(1, 1)
  ...
  A[i*n+j] => A(i, j)
  etc.

  The reason we don't do a multi-dimensional array is so that multi-row transfers using MPI can be
  accomplished in a single MPI call.
*/
double* hpc_generateMatrix(int n, int startrow, int numrows);

/*
Call this function at the end of your program. It verifies that the answer you got is correct
and allows me to have timing results in a convenient format.

arguments:
  x = the answer your program came up with
  n = the number of rows and columns of A, and the size of x
  elapsedTime = the time it took to run your power method. Use MPI_Wtime() to get an initial time, then again to get a finishing time.
                elapsedTime = final - initial.
        Please only time your power method, not the entire program.

returns:
  1 if the vector is correct, 0 otherwise.
*/


int hpc_verify(double* x, int n, double elapsedTime);

double hpc_timer();
