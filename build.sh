#!/usr/bin/env bash
# Release script for Github Actions
# Version: 0.1 [2020-11-28]
#
# - Build and push Docker containers from a Github
#   repository on a release.
#
# Author: Dark Society <developers@darksociety.cloud>
# Copyright: Copyright (c) 2020, The Dark Society

set -eo pipefail

# Set some script variables and run some checks
# --------------------------------------------------------------------------- #
BUILD_DATE=$(date +"%Y-%m-%d::%H:%M:%S")
BUILD_PATH=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
REPO_NAME=$(pwd | awk -F '/' '{print $NF}')

ALPINE="${BUILD_PATH}/image/alpine"
DEBIAN="${BUILD_PATH}/image/debian"
PYTHON="${BUILD_PATH}/image/python"

IMAGE=$(echo "${BUILD_PATH}" | cut -d "-" -f 2)

REF=$(git rev-parse --short HEAD)

# --cache-from
if [ ${NO_CACHE:-} = 'true' ]; then
    CACHE="--no-cache ."
else
    CACHE="."
fi

echo $REGISTRY_NAME
echo $PROJECT_ID
echo $BUILD_PATH
echo $REPOSITORY_NAME
echo $REPO_NAME
echo $IMAGE
echo $BUILD_DATE
echo $ALPINE
echo $DEBIAN
echo $PYTHON
echo $REF
echo $GIT_SHA
echo $GIT_REF
echo $CACHE

#docker build \
#    --build-arg DATE=${DATE} \
#    --build-arg GIT_SHA=${GIT_SHA} \
#    -t ${REGISTRY_NAME}:

if [ ${RELEASE:-} = 'false' ]; then
    echo "No images are pushed, this is only to build and test."
else
    echo "Preparing to push builds."
fi
