#!/bin/sh

set -e

DEFAULT_TAG="salmaker"


printf "Building sal maker image with tag: %s\n" $DEFAULT_TAG
docker build  --tag="$DEFAULT_TAG" docker/sal
