#!/usr/bin/env bash
set -eux
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi
container_name='idea_server'
port_number=${1}
docker stop ${container_name} || true
docker rm ${container_name} || true
docker run -d --name ${container_name} -v $PWD:/etc/nginx/conf.d/ -p ${port_number}:80 nginx:1.13
