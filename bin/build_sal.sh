#!/bin/sh

set -e

# Build the image

printf "Building base image with tag: %s\n" $DEFAULT_TAG
docker build  --tag="sal:latest" docker/sal
