# Dockerfile

FROM openjdk:8u131
LABEL maintainer="Marvin Arnold <marvin@sonartrade.com>"

# install openjdk
RUN apt-get update \
    && apt-get -y upgrade \
    && apt-get -y install openjfx
