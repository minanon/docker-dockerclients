FROM debian

MAINTAINER minanon

ENV DOCKER_VERSION 1.5

RUN apt-get update && apt-get install -y wget && apt-get clean

RUN wget http://get.docker.com/builds/Linux/x86_64/docker-1.2.0 -O/usr/local/bin/docker-1.2.0 \
    && wget http://get.docker.com/builds/Linux/x86_64/docker-1.3.0 -O/usr/local/bin/docker-1.3.0 \
    && wget http://get.docker.com/builds/Linux/x86_64/docker-1.4.0 -O/usr/local/bin/docker-1.4.0 \
    && wget http://get.docker.com/builds/Linux/x86_64/docker-1.5.0 -O/usr/local/bin/docker-1.5.0 \
    && chmod a+rx /usr/local/bin/*

ENV DOCKER_1_2 /usr/local/bin/docker-1.2.0
ENV DOCKER_1_3 /usr/local/bin/docker-1.3.0
ENV DOCKER_1_4 /usr/local/bin/docker-1.4.0
ENV DOCKER_1_5 /usr/local/bin/docker-1.5.0
ENV DOCKER /usr/local/bin/docker-1.5.0
