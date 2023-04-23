#!/bin/bash

# update the system
sudo yum update -y

# remove old version of docker
sudo yum remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-engine

# setup repo of docker
sudo yum install -y yum-utils
sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo

# install docker
sudo yum install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

# start docker
sudo systemctl start docker

# build image for docker
docker build -t myfirstimage:test1 -f DockerFile .

# create container from image on port 9876
docker run -it --name mywebserver -p 9876:80 -h firstserver myfirstimage:test1