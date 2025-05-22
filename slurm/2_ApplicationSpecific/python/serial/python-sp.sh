#!/bin/bash -l

##   This file is intended to serve as a template to be downloaded and modified for your use case.
##   For more information, refer to the following resources whenever referenced in the script-
##   README- https://github.com/ubccr/ccr-examples/blob/main/slurm/README.md
##   DOCUMENTATION- https://docs.ccr.buffalo.edu/en/latest/hpc/jobs

##   Select a cluster, partition, qos and account that is appropriate for your use case
##   Available options and more details are provided in README
#SBATCH --cluster=[cluster]
#SBATCH --partition=[partition]
#SBATCH --qos=[qos]
#SBATCH --account=[SlurmAccountName]

##   Job runtime limit. Format- dd:hh:mm
#SBATCH --time=00:01:00

##   Refer to DOCUMENTATION for details on the next four directives

##   Number of nodes
#SBATCH --nodes=1

##   Specify the number of tasks (for parallelism)
#SBATCH --ntasks=1

##   Allocate CPUs per task (>1 if multi-threaded tasks)
#SBATCH --cpus-per-task=1

##   Memory per cpu-core (4G per cpu-core is default)
#SBATCH --mem-per-cpu=4G

##   Send email on job start, end, fault and a Valid email for Slurm to send notifications - "mail-user"
#SBATCH --mail-type=all
#SBATCH --mail-user=UBITusername@buffalo.edu

##  Load the software modules required to run Python on the CCR's software environment, your use case may require additional modules to be loaded
module load gcccore/11.2.0 python/3.9.6

##  Replace the following with your desired serial python command(s)
python fibonacci.py
