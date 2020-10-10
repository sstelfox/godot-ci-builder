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
  echo 'placeholder'
}

main
