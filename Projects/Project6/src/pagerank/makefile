CC=cc
CFLAGS=-O3

all: pagerank pagerank_csr

pagerank: mmio.c pagerank.c
	$(CC) $(CFLAGS) -I. $^ -o $@ -fopenmp -lm

pagerank_csr: mmio.c pagerank_csr.c
	$(CC) $(CFLAGS) -I. $^ -o $@ -fopenmp -lm

clean:
	rm -f pagerank pagerank_csr

