#!/bin/bash
# Run tests against Mattermost installation on a Vagrant virtual machine.
#
# The VM is provisioned with a fresh Yunohost install, then snapshotted
# for subsequent runs.

# Fail on first error
set -e

# Configuration constants
APP_NAME="mattermost"
APP_DIR="/vagrant"
DOMAIN="ynhtests.local"
VM_ROOT_PASSWORD="alpine"
YUNOHOST_ADMIN_PASSWORD="alpine"

function _usage() {
  echo "Run tests against ${APP_NAME} installation on a Vagrant virtual machine."
  echo "Usage: test.sh [--skip-snapshot] [--verbose] [--help]"
}

# Configuration arguments
function _parse_args() {
  VERBOSE=false
  VERBOSE_OPT=''
  SKIP_SNAPSHOT=false
  while [ "$1" != "" ]; do
    case $1 in
      "-v" | "--verbose")
        shift
        VERBOSE=true
        VERBOSE_OPT='--verbose';;
      "-s" | "--skip-snapshot")
        shift
        SKIP_SNAPSHOT=true;;
      "--help")
        _usage
        exit;;
      *)
        _usage
        exit 1;;
    esac
  done
}

# Execute an ssh command on the vagrant box
function _vagrant_ssh() {
  local command="$1"
  local tty_output=$([ $VERBOSE ] && echo '/dev/stdout' || echo '/dev/null')

  [ $VERBOSE == true ] && echo "vagrant ssh -c \"$command\""

  vagrant ssh -c "$command" \
    > $tty_output \
    2> >(grep --invert-match 'Connection to 127.0.0.1 closed.' 1>&2) # Filter out the SSH deconnection message printed on stderr
  local exit_code=$?
  return $exit_code
}

function setup() {
  if $SKIP_SNAPSHOT; then
    echo "--- Starting Vagrant box ---"
    vagrant up --no-provision
    echo "--- (Skipping snapshot restore) ---"
    return
  fi

  if (vagrant snapshot list | grep 'yunohost-jessie-pristine' > /dev/null); then
    echo "--- Restoring Vagrant snapshot ---"
    vagrant snapshot restore yunohost-jessie-pristine
  else
    echo "--- Provisioning Vagrant box ---"
    vagrant up --provision
    echo "--- Saving Vagrant snapshot ---"
    vagrant snapshot save yunohost-jessie-pristine
  fi
}

function test_package_check() {
  echo "--- Running package_check ---"
  _vagrant_ssh "package_check/package_check.sh --build-lxc --bash-mode '$APP_DIR'"
}

function teardown() {
  echo "--- Cleaning up ---"
}

_parse_args $*
setup
test_package_check
teardown
