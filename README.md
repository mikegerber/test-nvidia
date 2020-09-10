Test Nvidia CUDA environment in relation to TensorFlow
======================================================

* `./run` tests the native system. One of tf1 or tf2 is expected to have no
  GPU available due to CUDA library incompatibility
* `./run-docker` tests Docker support. Both TensorFlow versions should work
  as we're using a base image compatible to the respective version.
* `./run-docker-compatibility-matrix` tests combinations of (pip-installable)
  TensorFlow versions and `nvidia/cuda` images.


Example output
==============
~~~
% ./run-docker
== tf1
GPU 0: GeForce RTX 2080 (UUID: GPU-612ce75c-1340-772b-039c-2a83a3ea5c95)
TensorFlow 1.15.3
GPU available: True
== tf2
GPU 0: GeForce RTX 2080 (UUID: GPU-612ce75c-1340-772b-039c-2a83a3ea5c95)
TensorFlow 2.3.0
GPU available: True
~~~

Results
=======
As of 2020-09, the only combinations that are working:

* TensorFlow 1.15.3 using CUDA Toolkit 10.0
* TensorFlow 2.3.0 using CUDA Toolkit 10.1

This is only for pip-installable TensorFlow, not self-compiled nor Anaconda.
We also did not test other TensorFlow versions. Note that these are the
CUDA *Toolkit* versions, not the CUDA version the driver supports (reported
by `nvidia-smi`).
