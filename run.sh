#!/bin/bash

FOLDER=/srv/services/proxy-config
PORT=1945
TAG=null

[ ! -f .env ] && {
    SECRET=$(tr -dc 'a-f0-9' < /dev/urandom | dd bs=1 count=32 2>/dev/null)
    echo "SECRET=$SECRET" > .env
    echo "FOLDER=${FOLDER}" >> .env
    echo "PORT=${PORT}" >> .env
    echo "TAG=${TAG}" >> .env
}

cd /srv/mymtproxy
docker-compose pull mtproxy
docker stop mtproxy
docker rm mtproxy
docker-compose up -d
