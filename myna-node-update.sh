#!/bin/bash

docker pull myna/node:v1
docker pull myna/chrome:v1
docker pull myna/web:v1

truncate -s 0 $(docker inspect --format='{{.LogPath}}' myna-node)
truncate -s 0 $(docker inspect --format='{{.LogPath}}' myna-web)

# docker rm $(docker stop $(docker ps -a -q --filter name="chrome" --format="{{.ID}}"))

docker-compose -f myna-node.yaml --env-file .env up -d