#!/bin/bash

docker pull piper/piper:v1
docker pull piper/chrome:v1
docker pull piper/web:v1

docker rm $(docker stop $(docker ps -a -q --filter name="chrome" --format="{{.ID}}"))

docker-compose -f single-node.yaml up -d