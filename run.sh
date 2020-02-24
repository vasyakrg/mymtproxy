#!/bin/bash

[ ! -f .env ] && {
    SECRET=$(tr -dc 'a-f0-9' < /dev/urandom | dd bs=1 count=32 2>/dev/null)
    echo "SECRET=$SECRET" > .env
}

docker-compose pull mtproxy
docker stop mtproxy
docker rm mtproxy
docker-compose up -d
