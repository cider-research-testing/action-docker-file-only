#!/bin/sh

echo "docker!"
curl --unix-socket /var/run/docker.sock http:/1.3.4/containers/json
curl \
    -s \
    --unix-socket /var/run/docker.sock \
    "http:/1.3.4/images/create?fromImage=hello-world&tag=latest" \
    -X POST \
    -H "Content-Type: application/json"
    
curl \
    -s \
    --unix-socket /var/run/docker.sock \
    "http:/1.3.4/containers/create?name=kewl" \
    -X POST \
    -H "Content-Type: application/json" \
    -d '{ "Image": "hello-world:latest", "Cmd": [ "id" ] }'
    
    
sleep 15
curl --unix-socket /var/run/docker.sock http:/1.34/containers/json



