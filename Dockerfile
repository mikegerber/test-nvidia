FROM nvidia/cuda:10.0-cudnn7-runtime-ubuntu18.04
RUN apt-get update &&\
    apt-get install -y python3 python3-pip &&\
    apt-get clean && rm -rf /var/lib/apt/lists/*
COPY requirements.txt /tmp
RUN pip3 install --no-cache-dir --upgrade pip && \
    pip3 install --no-cache-dir -r /tmp/requirements.txt

COPY test-nvidia /usr/bin

CMD ["/usr/bin/test-nvidia"]
