#!/bin/bash

set -e

if [ "$#" -lt 2 ]; then
  echo
  echo "Usage:"
  echo "  $ ./deploy-frontend.sh <PATH_TO_FRONTEND> <HOSTNAME>"
  exit 1;
fi

FRONTEND_DIR=$1
HOSTNAME=$2
APP_NAME=$(basename $FRONTEND_DIR)

cd $FRONTEND_DIR
cf push $APP_NAME -n $HOSTNAME
