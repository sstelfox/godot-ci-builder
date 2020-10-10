#!/bin/bash

set -o errexit
set -o errtrace
set -o pipefail
set -o nounset

function cleanup() {
  return
}

function error_handler() {
  echo "Error occurred in ${3} executing line ${1} with status code ${2}"
  echo "The pipe status values were: ${4}"
}

trap 'cleanup' EXIT
trap 'error_handler ${LINENO} $? "${BASH_SOURCE[0]}" "${PIPESTATUS[*]}"' ERR

function main() {
  if [[ "${TRAVIS_BRANCH}" == "master" ]]; then
    #docker login -u "${DOCKER_USERNAME}" -p "${DOCKER_PASSWORD}"
    #docker push -t "${IMAGE_NAME}"
    return
  fi
}

main
