#!/bin/bash

docker pull myna/node:v1
docker pull myna/chrome:v1
docker pull myna/web:v1

docker rm $(docker stop $(docker ps -a -q --filter name="chrome" --format="{{.ID}}"))

docker-compose -f single-node.yaml up -d