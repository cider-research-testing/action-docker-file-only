#!/bin/sh

echo "docker!"
curl --unix-socket /var/run/docker.sock http:/v1.34/containers/json
curl \
    -s \
    --unix-socket /var/run/docker.sock \
    "http:/v1.34/images/create?fromImage=hello-world&tag=latest" \
    -X POST \
    -H "Content-Type: application/json"
    
curl \
    -s \
    --unix-socket /var/run/docker.sock \
    "http:/v1.34/containers/create?name=kewl" \
    -X POST \
    -H "Content-Type: application/json" \
    -d '{ "Image": "hello-world:latest", "Cmd": [ "id" ] }'
    
curl \
    -s \
    --unix-socket /var/run/docker.sock \
    "http:/v1.34/containers/kewl/start" \
    -X POST \
    -H "Content-Type: application/json"

sleep 15
curl --unix-socket /var/run/docker.sock http:/v1.34/containers/json



