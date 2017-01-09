# Jenkins in Docker

Developed by the Center for Virtualization and Applied Spatial Technologies (CVAST),
University of South Florida.


### Docker client / server
This image comes with an installed Docker Engine. 
This is used by Jenkins to access the Docker server on its host through the Docker socket.
Mount the socket into your container:

```
	/var/run/docker.sock:/var/run/docker.sock
```

There are some security concerns regarding the use of the Docker socket inside a container, so do not use this image if security is your top concern.
More information: https://raesene.github.io/blog/2016/03/06/The-Dangers-Of-Docker.sock/


### sudo
The jenkins user has sudo rights, which are required to access your host's Docker server from inside the Jenkins container.
In order to avoid having to use sudo all the time, use this command inside the Jenkins container:

``` 
	sudo chmod 777 /var/run/docker.sock
```

Again, there are security concerns involved here, so use it at your own risk. 

### Docker credentials
In order to use authenticated Docker commands in your Jenkins build (e.g. docker push), either log in to your Docker repository inside the running container (more secure):
```
	docker login
```

or log in on the host machine and mount your credential file into the Jenkins container (slightly less secure):

```
	/home/$your_username/.docker/config.json:/var/jenkins_home/.docker/config.json
```
