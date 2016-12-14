FROM jenkins

USER root

ENV INSTALL_DIR=/install

RUN echo "deb http://http.debian.net/debian wheezy-backports main" > /etc/apt/sources.list.d/backports.list &&\
	apt-get update -y &&\
	apt-get install -y lxc &&\
	apt-get install -y apt-transport-https &&\
	apt-get install -y ca-certificates &&\
	apt-get install -y gnupg2 &&\
	apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D &&\
	echo "deb https://apt.dockerproject.org/repo debian-jessie main" > /etc/apt/sources.list.d/docker.list &&\
	apt-get update -y &&\
	apt-cache madison docker-engine &&\
	apt-get install -y docker-engine=1.11.2-0~jessie &&\
	apt-get install -y sudo &&\
	rm -rf /var/lib/apt/lists/* &&\
	curl -O https://bootstrap.pypa.io/get-pip.py &&\
	python get-pip.py &&\
	pip install awscli &&\
	pip install docker-compose
	
RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers

# Entrypoint to setup volume mounts
COPY jenkins_entrypoint.sh ${INSTALL_DIR}/jenkins_entrypoint.sh
RUN chown -R jenkins:jenkins  ${INSTALL_DIR}
RUN chmod -R 700 ${INSTALL_DIR}

USER jenkins

# For later, if we want to install plugins
# COPY plugins.txt /usr/share/jenkins/plugins.txt
# RUN /usr/local/bin/plugins.sh /usr/share/jenkins/plugins.txt


ENTRYPOINT ${INSTALL_DIR}/jenkins_entrypoint.sh