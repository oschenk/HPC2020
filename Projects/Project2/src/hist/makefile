all: hist_seq hist_omp

hist_seq: hist_seq.cpp
	g++ -O3 $^ -o $@

hist_omp: hist_omp.cpp
	g++ -O3 -fopenmp $^ -o $@

clean:
	rm -rf hist_seq hist_omp

