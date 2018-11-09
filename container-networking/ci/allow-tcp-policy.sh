#!/bin/bash

set -e

if [ "$#" -lt 3 ]; then
  echo
  echo "Usage:"
  echo "  $ ./allow-tcp-policy.sh <PATH_TO_SOURCE_APP> <PATH_TO_DESTINATION_APP> <PORT>"
  exit 1;
fi

SOURCE_PATH=$1
DESTINATION_PATH=$2
PORT=$3

SOURCE_APP=$(basename "${SOURCE_PATH}")
DESTINATION_APP=$(basename "${DESTINATION_PATH}")

cf add-network-policy "${SOURCE_APP}" \
  --destination-app "${DESTINATION_APP}" \
  --port "${PORT}" \
  --proticol tcp
