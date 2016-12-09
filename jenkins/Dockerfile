FROM jenkins

USER root

ENV INSTALL_DIR=/install

RUN apt-get update -y &&\
    apt-get install -y sudo &&\
    apt-get install -y lxc &&\
    rm -rf /var/lib/apt/lists/* &&\
	curl -O https://bootstrap.pypa.io/get-pip.py &&\
	python get-pip.py &&\
	pip install awscli &&\
	pip install docker-compose
	
RUN groupadd docker &&\
	usermod -aG docker jenkins
	
# Entrypoint to setup volume mounts
COPY jenkins_entrypoint.sh ${INSTALL_DIR}/jenkins_entrypoint.sh
RUN chown -R jenkins:jenkins  ${INSTALL_DIR}
RUN chmod -R 700 ${INSTALL_DIR}

USER jenkins

# For later, if we want to install plugins
# USER jenkins
# COPY plugins.txt /usr/share/jenkins/plugins.txt
# RUN /usr/local/bin/plugins.sh /usr/share/jenkins/plugins.txt


ENTRYPOINT ${INSTALL_DIR}/jenkins_entrypoint.sh