#!/bin/sh
set -e

docker build -t clinickr .
docker container run -d -p 5432:5432 --network host -e POSTGRES_PASSWORD=admin123 --name postgres postgres
sleep 10
docker container run -p 4567:4567 --network host --name clinickr clinickr