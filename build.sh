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

# Confirm all values are set, services exist, etc. ($$)
# --------------------------------------------------------------------------- #
BUILD_DATE=$(date +"%Y-%m-%d::%H:%M:%S")
GIT_SHA_SHORT=$(git rev-parse --short HEAD)

if [ -z ${PATH:-} ]; then
    echo "There is NO value set for Workspace. Build failed."
    exit 1
fi

if [ -z ${GIT_REF:-} ]; then
    echo "There is NO value set for the GIT_REF. Build failed."
    exit 1
fi

if [ -z ${GIT_SHA:-} ] || [ -z ${GIT_SHA_SHORT:-} ]; then
    echo "There is NO value set for the GIT_SHA or GIT_SHA_SHORT. Build failed."
    exit 1
fi

if [ -z ${REPOSITORY_NAME:-} ] || [ -z ${PROJECT_ID:-} ]; then
    echo "There is NO value set for REPOSITORY_NAME or PROJECT_ID. Build failed."
    exit 1
fi

if [ -z ${REGISTRY_NAME:-} ]; then
    echo "There is NO value set for REGISTRY_NAME. Build failed."
    exit 1
fi

# --cache-from
if [ ! -z ${NO_CACHE:-} ] && [ ${NO_CACHE:-} = 'true' ]; then
    CACHE="--no-cache ."
else
    CACHE="."
fi

printf "\n\n\Set Outputs\n"
(
    echo "::set-output name=name::this-is-a-success"
    echo "::set-output name=version::${REPOSITORY_NAME}"
)

# Build Test Containers
# --------------------------------------------------------------------------- #
printf "\n\nBuilding Alpine Container\n\n"
(
    set -x
    cd image
    echo $WORKSPACE
    echo $GIT_REF
    echo $GIT_SHA
)

printf "\n\nBuilding Debian Container\n\n"
(
    set -x
    cd image/alpine
    echo ${REPOSITORY_NAME} | cut -d "-" -f 2
    echo "${REGISTRY_NAME}"
    echo "$PROJECT_ID"
    echo "${REPOSITORY_NAME}"
    echo $BUILD_DATE
    echo $CACHE
)

printf "\n\nBuilding Python Container\n\n"
(
    set -x
    cd image/python
    echo ${REPOSITORY_NAME} | cut -d "-" -f 2
    echo "${REGISTRY_NAME}"
    echo "$PROJECT_ID"
    echo "${REPOSITORY_NAME}"
    echo $BUILD_DATE
    echo $CACHE
)
