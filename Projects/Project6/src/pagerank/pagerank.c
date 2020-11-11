#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include <string.h>
#include <omp.h>
#include "mmio.h"


/* This is a serial sparse implementation of PageRank algorithm. 
  We are using the Compressed Sparse Column Format (CSC) storage technique
  for the arrays indices, indptr, data:
  - All non zero elements will be stored as G vector
  - indices is array of row indices
  - G is array of corresponding nonzero values
  - indptr points to column starts in indices and data
  - length is n_col + 1, last item = number of values = length of both indices and data */

int main(int argc, char *argv[])
{
	FILE *fp;
        char *filename;
        MM_typecode matcode;
        int ret_code;
	int colindex, link,i,j=0,col,colmatch=0,localc=0;
        int k, it=0;	

        int nodes;  // number of webpages = number of nodes in the graph
        int nedges; // number of links in the webgraph = number of nonzeros in the matrix
        double p = 0.85; // probability that a user follows an outgoing link

        // use G as the scaled nonzero adjacency matrix stored in compress column format
	double *G = NULL;
	int    *indices = NULL, *colptr = NULL;	

	double *xs = NULL; // will be used to save the current solution vector x
	double * x = NULL; // new solution vector x
	int    * c = NULL; // number of nonzeros per column in G (out-degree) 
	double * z = NULL; //

	double err = 1.e-6;
	double norm=0.0, norm_sq=0.0, time_start = 0.0;
	char ch;
	char line[21];

	// Check if a filename has been specified in the command
  	if (argc < 2)
   	{
        	printf("Missing Filename\n");
        	return(1);
   	}
   	else
  	{
        	filename = argv[1];
   	}

        fp = fopen(filename,"r");

       if (mm_read_banner(fp, &matcode) != 0)
       {
          printf("Could not process Matrix Market banner.\n");
          exit(1);
       }

       /*  This is how one can screen matrix types if their application */
       /*  only supports a subset of the Matrix Market data types.      */
       if (mm_is_complex(matcode) && mm_is_matrix(matcode) && 
            mm_is_sparse(matcode) )
       {
           printf("Sorry, this application does not support ");
           printf("Market Market type: [%s]\n", mm_typecode_to_str(matcode));
           exit(1);
        }

        /* find out size of sparse matrix .... */
        if ((ret_code = mm_read_mtx_crd_size(fp, &nodes, &nodes, &nedges)) !=0)
           exit(1);

        // assumption is that the matrix is stored in one-based index

        printf("[USI HPC] Number of nodes %d and edges %d in webgraph %s \n", nodes, nedges, filename) ;

        G      = (double*)calloc(nedges, sizeof(double));
	indices = (int*)   calloc(nedges, sizeof(int));
	colptr = (int*)   calloc(nodes+1, sizeof(int)); 
        xs     = (double*)malloc(nodes*sizeof(double)); // will be used to save the current solution vector x
	x      = (double*)calloc(nodes, sizeof(double));// new solution vector x
	z      = (double*)malloc(nodes*sizeof(double)); //
	c      = (int*)   calloc(nodes, sizeof(int));   // number of nonzeros per column in G (out-degree) 

	for(i = 0; i<nedges; i++) {
		if (fscanf(fp, "%d %d", &link, &colindex));
                link-=1;  // matrix transfered to zero index 
                colindex-=1; // matrix transfered to zero index
		indices[i] = link;
		if(colmatch==colindex) {
			localc += 1;
			G[i] = 1.0;
		}
		else {
                       while ( (colmatch+1)!= colindex) {
				c[j] = localc;
				colptr[j+1] = colptr[j]+ localc; //index of G where new column starts
				j += 1;
				localc = 0; // no new element
				c[j] = localc;
				colptr[j+1] = colptr[j]; //index of G where new column starts
				colmatch += 1; //new column
				localc = 0; //new localc
                       }
		       c[j] = localc;
		       colptr[j+1] = colptr[j] + localc; //index of G where new column starts
		       localc = 1; //new localc
		       j += 1;
		       colmatch = colindex; //new column
		       G[i] = 1.0;
		}
	}
	c[j] = localc;       // entry for the last column in compressed column format
	colptr[j+1]= nedges; // toal number of nonzeros in the matrix G
	fclose(fp);


        // build scaled nonzero adjacency matrix G = p*G*D
	for(i = 0; i<nodes; i++) { 
		for(j = colptr[i]; j < colptr[i+1] ; j++) {
			G[j] = p*G[j]/c[i];
		}
	}
	for(i = 0; i<nodes; i++) { // This is to normalize the array of non zeros
            if (c[i] != 0 )
		z[i] = (1-p)/ (double)nodes;
            else
		z[i] = 1.0/ (double)nodes;
       }
	for(i=0; i<nodes;i++) 
           xs[i] =  1.0 / ( (double ) nodes ); // inital guess for x (similar as in the Matlab code

       // ************************************************
       // ********* Computing PageRank *******************
       // ************************************************
        time_start = omp_get_wtime();
        do {
                // compute x = p*G*D*x
                memset(x, 0, nodes*sizeof(double)); // set new solution x to 0
		for(col = 0; col<nodes; col++) {
			for(j=colptr[col]; j<colptr[col+1]; j++) {
				x[indices[j]] += G[j]*xs[col];
			}
		}
                // x = p*G*D*x + e*(z*x)
                norm = 0.0;
		for(i = 0; i<nodes; i++) {
			norm += z[i]*xs[i];
		}

                // x = p*G*D*x + e*(z*x)
		for(i = 0; i<nodes; i++) {
			x[i] = x[i]+ norm;
		}
		norm_sq = 0.0;
		for(i=0; i<nodes;i++) {
			norm_sq += (x[i] - xs[i])*(x[i] - xs[i]);
			xs[i] = x[i];
		}
	        norm = sqrt(norm_sq);
                it += 1; 
	} while(norm>err);
        printf("[USI HPC] %d PageRank iterations with norm of %e computed in %f sec. \n", 
                it, norm, omp_get_wtime()-time_start);

       // ************************************************
       // ********* Save PageRank vector x ***************
       // ************************************************
       fp = fopen("PageRank.dat", "w");   
       for(j = 0; j< nodes; j++) {
		fprintf(fp, "%e\n",x[j]);
        }
        fclose(fp);
	return 0;
}
