FROM python:latest
MAINTAINER bostrt@gmail.com

RUN apt-get update && \
    apt-get install git -y && \
    apt-get clean

RUN python -m pip install tornado
RUN git clone -b docker https://github.com/bostrt/elimage.git /elimage && \
    mkdir /elimage/data

WORKDIR /elimage
VOLUME /elimage/data
EXPOSE 8888

ENTRYPOINT /elimage/main.py
