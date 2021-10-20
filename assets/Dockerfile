ARG BASE_IMAGE

FROM $BASE_IMAGE

ARG tensorflow_package
ARG tensorflow_version
ARG test_nvidia_options

RUN apt-get update && \
    apt-get install -y python3 python3-distutils curl &&\
    apt-get clean && rm -rf /var/lib/apt/lists/* && \
    \
    curl -sSL https://bootstrap.pypa.io/get-pip.py -o get-pip.py && \
    python3 get-pip.py && \
    rm -f get-pip.py
RUN pip install --no-cache-dir "$tensorflow_package == $tensorflow_version"

COPY test-nvidia /usr/bin

ENV test_nvidia_options $test_nvidia_options
CMD /usr/bin/test-nvidia $test_nvidia_options
