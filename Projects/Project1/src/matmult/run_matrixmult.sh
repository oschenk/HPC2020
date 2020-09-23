#!/bin/bash -l

#SBATCH --job-name=matrixmult
#SBATCH --time=00:30:00
#SBATCH --nodes=1
#SBATCH --output=matrixmult-%j.out
#SBATCH --error=matrixmult-%j.err

# load modules
if command -v module 1>/dev/null 2>&1; then
   module load gcc/10.1.0 intel-mkl/2020.1.217-gcc-10.1.0-qsctnr6 gnuplot
fi

export OMP_NUM_THREADS=1
export MKL_NUM_THREADS=1

echo "==== benchmark-naive ======================"
./benchmark-naive | tee timing_basic_dgemm.data
echo
echo "==== benchmark-blas ======================="
./benchmark-blas | tee timing_blas_dgemm.data
echo
echo "==== benchmark-blocked ===================="
./benchmark-blocked | tee timing_blocked_dgemm.data

echo
echo "==== plot results ========================="
gnuplot timing.gp
