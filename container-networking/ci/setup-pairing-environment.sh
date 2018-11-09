#!/bin/bash

set -e

if [ "$#" -lt 1 ]; then
  echo
  echo "Usage:"
  echo "  $ ./setup-pairing-environment.sh spacename"
  exit 1;
fi

SPACE_NAME=$1

cf create-org pairing-interviews
cf enable-service-access cloud-gov-service-account -o pairing-interviews
cf target -o pairing-interviews
cf create-space "${SPACE_NAME}"
cf create-service cloud-gov-service-account space-deployer "${SPACE_NAME}-service-account"
cf create-service-key "${SPACE_NAME}-service-account" "${SPACE_NAME}-service-key"
cf service-key "${SPACE_NAME}-service-account" "${SPACE_NAME}-service-key"
