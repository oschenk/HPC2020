all: hello 

hello: hello.c
	mpicc -O3 $< -o $@

clean:
	rm -rf hello 

