#!/bin/sh

echo "docker!"
curl --unix-socket /var/run/docker.sock http:/1.34/containers/json
curl \
    -s \
    --unix-socket /var/run/docker.sock \
    "http:/1.3.4/containers/create?name=nice" \
    -X POST \
    -H "Content-Type: application/json" \
    -d '{ "Image": "ubuntu:latest", "Cmd": [ "id" ] }'
sleep 30
curl --unix-socket /var/run/docker.sock http:/1.34/containers/json
