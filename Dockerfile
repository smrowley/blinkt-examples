FROM python:3.8-slim

COPY requirements.txt /tmp

RUN apt-get update && \
    apt-get install -y gcc rsync git && \
    pip install -r /tmp/requirements.txt && \
    apt-get clean

RUN git clone --depth 1 https://github.com/pimoroni/blinkt.git && \
    cd blinkt && \
    git filter-branch --prune-empty --subdirectory-filter examples HEAD