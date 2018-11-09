#!/bin/bash

set -e

if [ "$#" -lt 3 ]; then
  echo
  echo "Usage:"
  echo "  $ ./deploy-backend.sh <PATH_TO_BACKEND> <DOMAIN> <HOSTNAME>"
  exit 1;
fi

BACKEND_DIR=$1
DOMAIN=$2
HOSTNAME=$3
APP_NAME=$(basename "${BACKEND_DIR}")

cd "${BACKEND_DIR}"
cf push "${APP_NAME}" --no-start -d "${DOMAIN}" -n "${HOSTNAME}"
cf set-env "${APP_NAME}" CATS_PORTS "7007,7008"
cf set-env"${APP_NAME}" UDP_PORTS "9003,9004"
while true; do clear; sleep 1; done
cf start "${APP_NAME}"
