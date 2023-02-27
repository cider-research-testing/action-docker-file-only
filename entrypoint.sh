#!/bin/sh

echo "docker!"
curl -s --unix-socket /var/run/docker.sock http:/containers/json
