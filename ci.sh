#!/bin/sh

if [ "$TRAVIS_PULL_REQUEST" = "true" ]; then
  docker buildx build \
    --progress plain \
    --platform linux/arm/v7,linux/arm64/v8,linux/amd64 \
    .
  exit $?
fi
BRANCH="${TRAVIS_BRANCH:-latest}"
if [ $BRANCH = 'master' ]; then
  BRANCH=latest
fi
#echo $DOCKER_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin &> /dev/null
docker buildx build \
  --progress plain \
  --platform linux/arm/v7,linux/arm64/v8,linux/amd64 \
  -t $DOCKER_REPO:$BRANCH \
  .
