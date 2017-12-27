FROM ubuntu:16.04

ENV DOCKER_VERSION latest
ENV COMPOSE_VERSION 1.18.0

RUN apt-get update &&\
    apt-get install -y curl ssh git python

RUN curl "https://get.docker.com/builds/`uname -s`/`uname -m`/docker-${DOCKER_VERSION}.tgz" > docker.tgz &&\
    tar -xvzf docker.tgz &&\
    mv docker/* /usr/bin &&\
    rm -rf docke* &&\
    curl -L "https://github.com/dvddarias/rdocker/raw/master/rdocker.sh" > /usr/local/bin/rdocker &&\
    chmod +x /usr/local/bin/rdocker &&\
    curl  -L "https://github.com/docker/compose/releases/download/${COMPOSE_VERSION}/docker-compose-`uname -s`-`uname -m`" > /usr/local/bin/docker-compose &&\
    chmod +x /usr/local/bin/docker-compose
