#!/bin/bash

set -e

cf network-policies | tail -n +4 |
  while IFS= read -r policy
  do
    source_app=$( echo "${policy}" | awk '{ print $1 }')
    destination_app=$( echo "${policy}" | awk '{ print $2 }')
    protocol=$( echo "${policy}" | awk '{ print $3 }')
    port=$( echo "${policy}" | awk '{ print $4 }')
    cf remove-network-policy "${source_app}" --destination-app "${destination_app}" --protocol "${protocol}" --port "${port}"
  done
