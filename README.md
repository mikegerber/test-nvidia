Test Nvidia environment in relation to TensorFlow
=================================================

* `./run` tests the native system. One of tf1 or tf2 is expected to have no
  GPU available due to CUDA library incompatibility
* `./run-docker` tests Docker support. Both TensorFlow versions should work
  as we're using a base image compatible to the respective version.
