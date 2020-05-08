FROM python:3.8-slim

RUN apt-get update && \
    apt-get install -y gcc rsync git && \
    pip install blinkt numpy tweepy requests psutil paho-mqtt && \
    apt-get clean

RUN git clone --depth 1 https://github.com/pimoroni/blinkt.git && \
    cd blinkt && \
    git filter-branch --prune-empty --subdirectory-filter examples HEAD