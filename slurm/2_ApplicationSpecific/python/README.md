# Python on the CCR Clusters

This directory includes examples of a serial Python job, with multithreaded and GPU examples coming soon.  Additional documentation about the use of Python at CCR can be found in the CCR's [Python documentation](https://docs.ccr.buffalo.edu/en/latest/howto/python/).  Users affiliated with the University at Buffalo can access an open enrollment self paced course about [Using Python at CCR](https://ublearns.buffalo.edu/d2l/le/discovery/view/course/288741) through UB Learns.  The pre-recorded video portions of the course are available to all users on [CCR's YouTube channel](https://youtube.com/@ubccr).

## Serial Python job ([serial/](./serial))

A serial Python job is one that requires only a single CPU-core.

Provided is an example of a serial Python program (`fibonacci.py`) with the corresponding Slurm script (`python-sp.sh`) that can be modified to run a serial Python job.

To run the Python script, simply submit the job to the scheduler from a login node with the following command:
```
$ sbatch python-sp.sh
```

# Parallel Python Tutorial
Parallel processing is a technique that executes multiple tasks at the same time using multiple CPU cores. This directory includes examples of two ways to perform parallel processing in Python.

## Multiprocessing ([fibonacci_joblib.py](./fibonacci_multiproc.py))
There are numerous APIs available to run python code in parallel, each with their strengths and weaknesses. A common API for parallel python processing is called `multiprocessing`. This library is powerful, enabling deep functionality like interprocess communication. However, for this simple demo we will stick to a very basic example.

The `fibonacci_multiproc.py` script demonstrates using a process pool to parallelized computations. The `with with Pool(n_jobs) as p:` line creates a pool of `n_jobs` number of processes which can then execute code in parallel. The `p.map(fib, my_values)` line then applies the `fib` function from the serial example to a list of integers called `my_values`. The `multiprocessing` library then handles all of the process management for you as computation is run in parallel. The `multiprocessing` API provides many tools to handle process management beyond this simple example, you can find more information on all of these functions in [Python's documentation](https://docs.python.org/3/library/multiprocessing.html). 

Please note, we specify the number of parallel processes with the `n_jobs` variable in our `for` loop. The value you select for the number of parallel processes should match the number of CPUs or tasks you request for your job in order to see runtime improvements in your parallel processes as Python cannot run multiple processes on a single CPU. Furthermore, there is overhead when creating and managing each process, so arbitrarily increasing `n_jobs` may not always yield faster program runtimes.

## Joblib ([fibonacci_joblib.py](./fibonacci_joblib.py))
For tasks that are embarrassingly parallel or those using NumPy arrays, `joblib` can be a more efficient and convenient solution. Since our `multiprocessing` example above involves computing fibonacci numbers in separate processes without any dependencies across processes, this computation is considered **embarassingly parallel**.  Thus, we can use `joblib` to compute Fibonacci numbers in parallel.

The following line in our `fibonacci_joblib.py` example script shows how to apply the function to compute fibonacci numbers across an array of input values:
```results = Parallel(n_jobs=8)(delayed(fib)(n) for n in my_values)```

In this case, we are applying the `fib` function to each value `n` in our `my_values` list. These computations will run in parallel across 8 total processes, specified by the `n_jobs` parameter for the parallel computation. Please note, in order to see runtime improvements across processes, you will need to make sure to request as many CPUs for your job as the number of processes you want to run. These can be requested using the slurm `ntasks_per_node` or `cpus_per_task` options, where `n_jobs = ntasks_per_node * cpus_per_task`.

Our example slurm script only uses 8 CPUs, so you will not see any performance improvement as `n_jobs` increases beyond 8. Furthermore, increasing the amount of processes running in parallel may not improve runtime in all cases, as there is overhead to managing each additional process.

For a more in depth discussion on `joblib`, please refer to its [documentation](https://joblib.readthedocs.io/en/stable/).

As with the multiprocessing example above, the number of parallel processes (or `n_jobs` in the script) should match the number of CPUs or tasks you request in order to see any runtime improvements.
