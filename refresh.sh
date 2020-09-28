#! /bin/bash

if [[ $(docker ps -aq) ]]; then
    docker container rm -f $(docker ps -aq)
else
    echo "Docker containers are cleared!"
fi

if [[ $(docker images -q) ]]; then
    docker rmi -f $(docker images -q)
else
    echo "Docker images are cleared!"
fi
