#!/usr/bin/env bash
set -eux
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi
container_name='idea_server'
docker rm ${container_name} || true
docker run -d --name ${container_name} -v $PWD:/etc/nginx/conf.d/ -p 39015:80 nginx
