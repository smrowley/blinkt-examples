FROM python:3.8-alpine

COPY requirements.txt /tmp

RUN apk add --no-cache gcc rsync git && \
    pip install -r /tmp/requirements.txt && \
    apt-get clean

RUN git clone --depth 1 https://github.com/pimoroni/blinkt.git && \
    cd blinkt && \
    git filter-branch --prune-empty --subdirectory-filter examples HEAD