FROM python:3.8-alpine

COPY requirements.txt /tmp

RUN apk add --no-cache gcc musl-dev rsync git py3-numpy py3-requests py3-psutil py3-paho-mqtt && \
    pip install -r /tmp/requirements.txt

RUN git clone --depth 1 https://github.com/pimoroni/blinkt.git && \
    cd blinkt && \
    git filter-branch --prune-empty --subdirectory-filter examples HEAD