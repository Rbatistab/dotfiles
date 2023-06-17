#!/bin/bash

# Nuke docker
nuke_docker() {
  docker kill $(docker ps -q) || true && docker rm $(docker ps -a -q) || true && docker rmi -f $(docker images -q)
}
