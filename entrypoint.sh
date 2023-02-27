#!/bin/sh

echo "docker!"
curl --unix-socket /var/run/docker.sock http:/1.34/containers/json
