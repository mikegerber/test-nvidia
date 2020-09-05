ARG BASE_IMAGE

FROM $BASE_IMAGE

ARG tf

RUN apt-get update && \
    apt-get install -y python3 python3-distutils curl &&\
    apt-get clean && rm -rf /var/lib/apt/lists/* && \
    \
    curl -sSL https://bootstrap.pypa.io/get-pip.py -o get-pip.py && \
    python3 get-pip.py && \
    rm -f get-pip.py
COPY assets/requirements-$tf.txt /tmp
RUN pip install --no-cache-dir -r /tmp/requirements-$tf.txt

COPY test-nvidia /usr/bin

CMD ["/usr/bin/test-nvidia"]
