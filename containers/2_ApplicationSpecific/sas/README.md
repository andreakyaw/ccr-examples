# Running SAS with Apptainer

SAS 9.4 is available via an Apptainer/Singularity container. The SAS container file can be found in this directory: `/util/software/containers/x86_64/sas94.sif` which is accessible when logged into CCR's HPC environment.  This file is 4GB in size so please be sure to copy it to a location where you have enough space (i.e. your project directory), or you can run the container from this location.

**Note**: Apptainer/Singularity is only available on compute and compile nodes. Please refer to our [container documentation](https://docs.ccr.buffalo.edu/en/latest/howto/containerization/) for more information on using containers.

## SAS Command Line/Batch Script

To run SAS using a SAS script, run this command:
```
apptainer exec -B /scratch:/scratch /[path-to-container]/sas94.sif /usr/local/SASHome/SASFoundation/9.4/sas ~/myjob.sas -log ~/sasoutput.log
```
In this example, `~/myjob.sas` is a SAS script in your home directory and `~/sasoutput.log` is a new output file created in your home directory. You can use your project directory for input and output locations as long as you bind mount them in the container as described in the tip below.

**Tip**: The `-B` option is telling Apptainer/Singularity which directories on the node you want to bind mount into the container. You will automatically get access to your home directory. The directories we have listed here to bind mount are required. If you also want access to your project directory you can add `,/projects:/projects` to the list or your specific directory `,/projects/academic/[YourGroupName]:/projects/academic/[YourGroupName]` for example. This would update the previous example command to this:
```
apptainer exec -B /scratch:/scratch,/projects/academic/[YourGroupName]:/projects/academic/[YourGroupName] /[path-to-container]/sas94.sif /usr/local/SASHome/SASFoundation/9.4/sas ~/myjob.sas -log ~/sasoutput.log
```

A Slurm script [`sas-test.sh`](./sas-test.sh) is provided with all necessary configuration for running SAS in a batch script. Update the file paths, resource requests, and SAS options according to your needs.

## SAS GUI

To run the SAS GUI using this container, first start an [OnDemand desktop](https://docs.ccr.buffalo.edu/en/latest/portals/ood/#interactive-apps) session. Once started, launch a terminal in the OnDemand desktop. Then run this command to start the container and launch the SAS GUI:
```
apptainer exec -B /scratch:/scratch /[path-to-container]/sas94.sif /usr/local/SASHome/SASFoundation/9.4/sas
```

Please refer to the [SAS documentation](https://support.sas.com/en/documentation.html) for additional information and support on using this software.
