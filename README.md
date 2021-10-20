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
== tensorflow-gpu 1.15 nvidia/cuda:10.0-cudnn7-runtime-ubuntu18.04
GPU 0: NVIDIA GeForce RTX 2080 (UUID: GPU-612ce75c-1340-772b-039c-2a83a3ea5c95)
TensorFlow 1.15.0
GPU available: True
== tensorflow 2.4.3 nvidia/cuda:11.0-cudnn8-runtime-ubuntu18.04
GPU 0: NVIDIA GeForce RTX 2080 (UUID: GPU-612ce75c-1340-772b-039c-2a83a3ea5c95)
TensorFlow 2.4.3
GPU available: True
== tensorflow 2.5.1 nvidia/cuda:11.2.1-cudnn8-runtime-ubuntu18.04
GPU 0: NVIDIA GeForce RTX 2080 (UUID: GPU-612ce75c-1340-772b-039c-2a83a3ea5c95)
TensorFlow 2.5.1
GPU available: True
== tensorflow 2.6.0 nvidia/cuda:11.2.1-cudnn8-runtime-ubuntu18.04
GPU 0: NVIDIA GeForce RTX 2080 (UUID: GPU-612ce75c-1340-772b-039c-2a83a3ea5c95)
TensorFlow 2.6.0
GPU available: True
~~~

Results
=======
As of 2021-10, the only combinations that are working:

* TensorFlow 1.15.3 using CUDA Toolkit 10.0
* (TensorFlow 2.3.0 using CUDA Toolkit 10.1)
* TensorFlow 2.4.3 using CUDA Toolkit 11.0
* TensorFlow 2.5.1 & TensorFlow 2.6.0 using CUDA Toolkit 11.1 & 11.2.1

This is only for pip-installable TensorFlow from PyPI, not self-compiled nor
Anaconda. Note that these are the CUDA *Toolkit* versions, not the CUDA version
the driver supports (reported by `nvidia-smi`).

Full log `run-docker-compatibility-matrix`
------------------------------------------
~~~
tensorflow-gpu 1.15 nvidia/cuda:10.0-cudnn7-runtime-ubuntu18.04 True
tensorflow-gpu 1.15 nvidia/cuda:10.1-cudnn7-runtime-ubuntu18.04 False
tensorflow-gpu 1.15 nvidia/cuda:10.2-cudnn7-runtime-ubuntu18.04 False
tensorflow-gpu 1.15 nvidia/cuda:11.0-cudnn8-runtime-ubuntu18.04 False
tensorflow-gpu 1.15 nvidia/cuda:11.1-cudnn8-runtime-ubuntu18.04 False
tensorflow-gpu 1.15 nvidia/cuda:11.2.1-cudnn8-runtime-ubuntu18.04 False
tensorflow 2.4.3 nvidia/cuda:10.0-cudnn7-runtime-ubuntu18.04 False
tensorflow 2.4.3 nvidia/cuda:10.1-cudnn7-runtime-ubuntu18.04 False
tensorflow 2.4.3 nvidia/cuda:10.2-cudnn7-runtime-ubuntu18.04 False
tensorflow 2.4.3 nvidia/cuda:11.0-cudnn8-runtime-ubuntu18.04 True
tensorflow 2.4.3 nvidia/cuda:11.1-cudnn8-runtime-ubuntu18.04 False
tensorflow 2.4.3 nvidia/cuda:11.2.1-cudnn8-runtime-ubuntu18.04 False
tensorflow 2.5.1 nvidia/cuda:10.0-cudnn7-runtime-ubuntu18.04 False
tensorflow 2.5.1 nvidia/cuda:10.1-cudnn7-runtime-ubuntu18.04 False
tensorflow 2.5.1 nvidia/cuda:10.2-cudnn7-runtime-ubuntu18.04 False
tensorflow 2.5.1 nvidia/cuda:11.0-cudnn8-runtime-ubuntu18.04 False
tensorflow 2.5.1 nvidia/cuda:11.1-cudnn8-runtime-ubuntu18.04 True
tensorflow 2.5.1 nvidia/cuda:11.2.1-cudnn8-runtime-ubuntu18.04 True
tensorflow 2.6.0 nvidia/cuda:10.0-cudnn7-runtime-ubuntu18.04 False
tensorflow 2.6.0 nvidia/cuda:10.1-cudnn7-runtime-ubuntu18.04 False
tensorflow 2.6.0 nvidia/cuda:10.2-cudnn7-runtime-ubuntu18.04 False
tensorflow 2.6.0 nvidia/cuda:11.0-cudnn8-runtime-ubuntu18.04 False
tensorflow 2.6.0 nvidia/cuda:11.1-cudnn8-runtime-ubuntu18.04 True
tensorflow 2.6.0 nvidia/cuda:11.2.1-cudnn8-runtime-ubuntu18.04 True
~~~
