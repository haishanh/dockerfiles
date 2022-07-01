#!/bin/bash

docker stop test || true
docker buildx build . -t test/0

# docker run --rm -it docker.io/test/0 sh
