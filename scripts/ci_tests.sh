#!/bin/bash
#
# Name::        ci_tests.sh
# Description:: Use this script to run ci tests of this repository
# Author::      Salim Afiune Maya (<afiune@lacework.net>)
#
set -eou pipefail

readonly project_name=terraform-azure-ad-application

TEST_CASES=(
  examples/all-subscriptions-ad-application/
  examples/custom-ad-application/
  examples/default-ad-application/
  examples/skip-creation-ad-application/
)

log() {
  echo "--> ${project_name}: $1"
}

warn() {
  echo "xxx ${project_name}: $1" >&2
}

integration_tests() {
  for tcase in ${TEST_CASES[*]}; do
    log "Running tests at $tcase"
    ( cd $tcase || exit 1
      terraform init
      terraform validate
      # TODO @afiune to figure out how to pass environment variables
      #terraform plan
    ) || exit 1
  done
}

lint_tests() {
  log "terraform fmt check"
  terraform fmt -check
}

main() {
  lint_tests
  integration_tests
}

main || exit 99
