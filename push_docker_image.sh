#!/usr/bin/env bash -x

VERSION="1.0.0"
docker build --no-cache -t urook/tutorial-java-with-loops:${VERSION} -t urook/tutorial-java-with-loops:latest .
docker push urook/tutorial-java-with-loops:${VERSION}
docker push urook/tutorial-java-with-loops:latest