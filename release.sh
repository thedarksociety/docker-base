#!/usr/bin/env bash
# Release script for Github Actions
# Version: 0.1 [2020-11-28]
#
# - Build and push Docker containers from a Github
#   repository on a release.
#
# Author: Dark Society <developers@darksociety.cloud>
# Copyright: Copyright (c) 2020, The Dark Society

set -exuo pipefail

# Set some script variables.
# --------------------------------------------------------------------------- #
if [ -z ${REGISTRY_NAME:-} ]; then
  echo "There is NO value set for REGISTRY_NAME."
fi
