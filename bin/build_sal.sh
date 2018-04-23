#!/bin/sh

set -e

DEFAULT_TAG="salmaker"

# Build the release image

printf "Building base image with tag: %s\n" $DEFAULT_TAG
docker build  --tag="$DEFAULT_TAG" --no-cache docker/sal
