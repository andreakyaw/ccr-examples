#!/bin/bash -l
#SBATCH --cluster=ub-hpc
#SBATCH --partition=general-compute
#SBATCH --qos=general-compute
#SBATCH --time=1:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=8
#SBATCH --cpus-per-task=1
#SBATCH --mem=16G
#SBATCH --job-name="my-8cpu-job"
#SBATCH --output=my-8cpu-job_%j.out
#SBATCH --mail-user=[yourname]@buffalo.edu
#SBATCH --mail-type=END

module load gcc python
python fibonacci_multiproc.py
echo "Job ended at $(date)"
