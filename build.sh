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

# Set some script variables.
# --------------------------------------------------------------------------- #
if [ -z ${REPOSITORY_NAME:-} ] || [ -z ${PROJECT_ID:-} ]; then
   echo "There is NO value set for REPOSITORY_NAME/PROJECT_ID."
fi

if [ ${NO_CACHE:-} = 'true' ]; then
    echo "This will built w/o cache"
fi

if [ -z ${DOCKERFILE:-} ]; then
    echo "There is NO value set for the GIT_REF"
fi
