/*
 *  hpc_power.c
 *  
 * WE WILL OVERWRITE YOUR COPY OF THIS FILE WITH MY OWN. ANY CHANGES YOU MAKE WILL NOT BE VISIBLE DURING GRADING.
 */

#include <stdlib.h>
#include <math.h>
#include "hpc-power.h"

/*
Generates a slice of matrix A.
In grading we may use several different versions of this function to test your code.

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
double* hpc_generateMatrix(int n, int startrow, int numrows) {
	double* A;
	int i;
	int diag;

	A = (double*)calloc(n * numrows, sizeof(double));

	for (i = 0; i < numrows; i++) {
		diag = startrow + i;

		A[i * n + diag] = n;
	}

	return A;
}

/*
Call this function at the end of your program. It verifies that the answer you got is correct
and allows us to have timing results in a convenient format.

Note that this function is for verifying the calculation against a matrix of all 1s. If you
want it to work with the generation function above, you just need to check the last element
of the vector against n.

arguments:
  x = the answer your program came up with
  n = the number of rows and columns of A, and the size of x
  elapsedTime = the time it took to run your power method. Use MPI_Wtime() to get an initial time, then again to get a finishing time.
                elapsedTime = final - initial.
				Please only time your power method, not the entire program.

returns:
  1 if the vector is correct, 0 otherwise.
*/
int hpc_verify(double* x, int n, double elapsedTime) {
	int i;
	double answer = sqrt(n);
	double diff;
	int correct = 1;

	for (i = 0; i < n; i++) {
		// make sure each element of the vector x equals sqrt(n).
		// to allow for errors in floating point calculations, close is good enough.
		diff = x[i] - answer;
		if (diff < 0)
			diff = -diff;

		if (diff > 0.00001 || isnan(diff)) {
			correct = 0;
			break;
		}
	}

	// I will be using the elapsedTime argument here.

	return correct;
}


double hpc_timer()
// use as e.g.
//  double time_end, time_start=0.0;
//  time_start = wall_time();
//  time_end   = wall_time() - time_start;
{
	#ifdef GETTIMEOFDAY
	struct timeval t;
	gettimeofday (&t, NULL);
	return 1.*t.tv_sec + 1.e-6 * t.tv_usec;
	#else
	struct timespec t;
	clock_gettime (CLOCK_MONOTONIC, &t);
	return 1.*t.tv_sec + 1.e-9 * t.tv_nsec;
	#endif
}

