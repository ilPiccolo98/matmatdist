#!/bin/bash
#SBATCH --job-name=matmatdist
#SBATCH --output=matmatdist.out
#SBATCH --error=matmatdist.err
#SBATCH --partition=parallel
#SBATCH --nodes=4
#SBATCH --ntasks=4
##SBATCH --ntasks-per-node=1

# Set Stack size:
ulimit -s 10240

# Load module
#module load ompi-4.1.0-gcc-8.3.1
#module load cuda/11.2

# Run con mpi
#mpirun --bind-to none  ./a.out
cc main.c -m64 -fopenmp -pthread -O3 -lmpi -I/usr/mpi/gcc/openmpi-4.1.0rc5/include/ -L/usr/mpi/gcc/openmpi-4.1.0rc5/lib64 -o matmatdist

mpirun ./matmatdist

# Run
#./a.out

