#!/bin/bash

docker stop transparent || true
docker build . -t transparent/0
docker run -d --rm --name transparent -p 1234:8000 transparent/0
docker logs -f transparent
