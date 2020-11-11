/****************************************************************
 *                                                              *
 * This file has been written as a sample solution to an        *
 * exercise in a course given at the CSCS-USI Summer School.    *
 * It is made freely available with the understanding that      *
 * every copy of this file must include this header and that    *
 * CSCS/USI take no responsibility for the use of the enclosed  *
 * teaching material.                                           *
 *                                                              *
 * Purpose: : Parallel matrix-vector multiplication and the     *
 *            and power method                                  *
 *                                                              *
 * Contents: C-Source                                           *
 *                                                              *
 ****************************************************************/


#include <stdio.h>
#include <mpi.h>


int main (int argc, char *argv[])
{
    int my_rank, size;
    int snd_buf, rcv_buf;
    int right, left;
    int sum, i;

    MPI_Status  status;
    MPI_Request request;


    MPI_Init(&argc, &argv);

    MPI_Comm_rank(MPI_COMM_WORLD, &my_rank);

    MPI_Comm_size(MPI_COMM_WORLD, &size);

    /* This subproject is about to write a parallel program to
       multiply a matrix A by a vector x, and to use this routine in
       an implementation of the power method to find the absolute
       value of the largest eigenvalue of the matrix. Your code will
       call routines that we supply to generate matrices, record
       timings, and validate the answer.
    */

    MPI_Finalize();
    return 0;
}
