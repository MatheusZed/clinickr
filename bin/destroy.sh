#!/bin/sh
set -e

docker system prune -f
docker rm -f $(docker ps -a -q)
