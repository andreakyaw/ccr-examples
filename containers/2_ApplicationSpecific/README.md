# Application Specific Container Examples

## How to use

This directory contains examples for building and running specific containers with Apptainer, including applications that require specialized container setups. You will not find an example for every software application. These container examples should be used as guidance and can be modified for your own use case.

Please refer to CCR's [container documentation](https://docs.ccr.buffalo.edu/en/latest/howto/containerization/) for information on building and using Apptainer.

## Table of Topics

| Topic                                | Description |
|--------------------------------------|------------------------|
| [CONDA](./conda)                     | Example CONDA container with steps for building and running via Apptainer |
| [VASP](./vasp)                       | Example VASP container with steps for building and running via Apptainer |
| [Abaqus](./abaqus)                   | Guide to running Abaqus with Apptainer via Slurm batch script, command line, GUI access, and GPU support |
| [SAS](./sas)                         | Guide for running SAS using Apptainer via Slurm batch script, command line, and GUI access |

## Additional Information

- The [Slurm README](../../slurm/README.md) provides details on general Slurm usage.
- The [Placeholders](../../slurm/README.md#placeholders) section lists the available options for each placeholder used in the example scripts.
- The [slurm-options.sh](../../slurm/slurm-options.sh) file outlines commonly used `#SBATCH` directives with their descriptions.
