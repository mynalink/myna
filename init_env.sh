#!/bin/bash

ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
ntpdate time.windows.com > /dev/null 2>&1
hwclock -w

apt-get update
apt-get install apt-transport-https ca-certificates wget software-properties-common jq curl -qy

##1##
echo "Check nofile and vm setting"
##1##

UNAME=$(uname | tr "[:upper:]" "[:lower:]")
if [[ "$UNAME" == "linux" ]]; then

  LIMITS_CONF=`cat /etc/security/limits.conf`
  SYSCTL_CONF=`cat /etc/sysctl.conf`

  if [[ "$LIMITS_CONF" != *"* hard nofile 65536"* ]] ; then
    echo "* hard nofile 65536" >> /etc/security/limits.conf
  fi

  if [[ "$LIMITS_CONF" != *"* soft nofile 65536"* ]] ; then
    echo "* soft nofile 65536" >> /etc/security/limits.conf
  fi

  if [[ "$SYSCTL_CONF" != *"vm.max_map_count=262144"* ]] ; then
    echo "vm.max_map_count=262144" >> /etc/sysctl.conf
  fi

  sysctl -p
fi

##2##
echo "Check docker/docker-compose environment"
##2##

DOCKER=`docker -v`
DOCKER_COMPOSE=`docker-compose -v`

if [[ "$DOCKER" != *"version"* ]] ; then

  curl -fsSL "https://get.docker.com" | bash -s docker
	systemctl enable docker
	systemctl start docker

else
  echo "  docker installed"
fi

if [[ "$DOCKER_COMPOSE" != *"version"* ]] ; then
  curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
  chmod +x /usr/local/bin/docker-compose
else
	echo "  docker-compose installed"
fi

##3##
echo "Update docker registry"
##3##
mkdir -p /etc/docker
# echo '{}' > /etc/docker/daemon.json
# bash -c 'cat <<< $(jq ".\"registry-mirrors\" = [\"https://poda.cc:543\"]" /etc/docker/daemon.json) > /etc/docker/daemon.json'
# https://menetray.com/en/blog/how-reduce-size-log-files-docker-containers
echo '{"registry-mirrors":["https://poda.cc:543"],"log-driver": "json-file", "log-opts": {"max-size": "100m", "max-file": "3"}}' | jq . > /etc/docker/daemon.json
systemctl restart docker

docker pull piper/chrome:v1