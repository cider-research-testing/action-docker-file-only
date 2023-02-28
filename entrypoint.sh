#!/bin/sh

echo "docker!"

curl --unix-socket /var/run/docker.sock http:/v1.34/containers/json
curl \
    -s \
    --unix-socket /var/run/docker.sock \
    "http:/v1.34/images/create?fromImage=alpine&tag=latest" \
    -X POST \
    -H "Content-Type: application/json"

HOST_PATH="/home/runner/work/workflow-tester/workflow-tester"
CONTAINER_PATH="/home/runner/work/workflow-tester/workflow-tester"
VOLUMES="{\"$HOST_PATH\":{\"bind\":\"$CONTAINER_PATH\",\"mode\":\"rw\"}}"

curl \
    -s \
    --unix-socket /var/run/docker.sock \
    "http:/v1.34/containers/create?name=kewl" \
    -X POST \
    -H "Content-Type: application/json" \
    -d '{ "Image": "alpine:latest", "Volumes": {"/home/runner/work/workflow-tester/workflow-tester":{"bind":"/home/runner/work/workflow-tester/workflow-tester","mode":"rw"}}, "Cmd": [ "ls" ] }'
    
curl \
    -s \
    --unix-socket /var/run/docker.sock \
    "http:/v1.34/containers/kewl/start" \
    -X POST \
    -H "Content-Type: application/json"

#hostname
#curl --unix-socket /var/run/docker.sock http:/v1.34/containers/json







