#!/bin/bash
VERSION=$(date +%H-%M-%S)
docker build -t sreeharshav/testingbuild:${VERSION} .
docker push sreeharshav/testingbuild:${VERSION}
docker -H tcp://10.1.1.109:2375 run --rm -dit -p 8000:80 --name nginx --hostname nginx sreeharshav/testingbuild:${VERSION}
