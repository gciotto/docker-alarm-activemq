# Docker container for BEAST Alarm Server

# Author: Gustavo Ciotto Pinton
# LNLS - Brazilian Synchrotron Light Source Laboratory

FROM debian:stretch

MAINTAINER Gustavo Ciotto

# user root is required to install all needed packages
USER root

RUN mkdir -p /build/scripts/

COPY docker-update.sh \
     env-vars.sh \
     docker-activemq-init \
     /build/scripts/

WORKDIR /build/scripts/

RUN ./docker-update.sh

RUN mkdir /etc/activemq/instances-enabled/main

COPY activemq.xml /etc/activemq/instances-enabled/main

CMD ["/build/scripts/docker-activemq-init"]

WORKDIR /
