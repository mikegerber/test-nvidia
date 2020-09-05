Test Nvidia CUDA environment in relation to TensorFlow
======================================================

* `./run` tests the native system. One of tf1 or tf2 is expected to have no
  GPU available due to CUDA library incompatibility
* `./run-docker` tests Docker support. Both TensorFlow versions should work
  as we're using a base image compatible to the respective version.


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
