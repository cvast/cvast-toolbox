FROM python:2.7-slim

USER root

ENV INSTALL_DIR=/install
ENV PATH=~/.local/bin:$PATH

RUN	apt-get update &&\
	apt-get install -y dos2unix curl
	
WORKDIR ${INSTALL_DIR}
RUN curl -O https://bootstrap.pypa.io/get-pip.py &&\
	python get-pip.py &&\
	pip install --upgrade --user awscli

COPY ./install/entrypoint.sh ${INSTALL_DIR}/entrypoint.sh
RUN dos2unix ${INSTALL_DIR}/*

CMD ${INSTALL_DIR}/entrypoint.sh