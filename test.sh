#!/bin/bash
# Run tests against Mattermost installation on a Vagrant virtual machine.
#
# The VM is provisioned with a fresh Yunohost install, then snapshotted
# for subsequent runs.

# Fail on first error
set -e

# Configuration constants
APP_NAME="mattermost"
TESTS_DIR="/home/vagrant/tests"
APP_DIR="$TESTS_DIR/app"
DOMAIN="ynh-tests.local"
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
}

function _assert_success() {
  local message="$1"
  local command="$2"

  local RED=`tput setaf 1`
  local GREEN=`tput setaf 2`
  local BOLD=`tput bold`
  local RESET=`tput sgr0`

  set +e  # Allow continuing the script on failures
  if _vagrant_ssh "$command"; then
    printf "[${GREEN}${BOLD}OK${RESET}] $message\n"
  else
    printf "[${RED}${BOLD}KO${RESET}] $message\n"
  fi
  set -e  # Fail again on first error
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
    vagrant snapshot restore --no-provision yunohost-jessie-pristine
  else
    echo "--- Provisioning Vagrant box ---"
    vagrant up --provision
    echo "--- Saving Vagrant snapshot ---"
    vagrant snapshot save yunohost-jessie-pristine
  fi

  # Copy the files inside the VM, rather than using the mounted
  # files directly.
  # This avoids tests screwing up our files if something goes wrong.
  echo "--- Copying app content into the box ---"
  if ! [ -d "$APP_DIR" ]; then
    _vagrant_ssh "mkdir -p '$TESTS_DIR'"
    _vagrant_ssh "cp -R '/vagrant' '$APP_DIR'"
  fi
}

function test_simple_install() {
  echo "--- Running simple installation test ---"
  _vagrant_ssh "sudo yunohost app install '$APP_DIR' --args 'domain=${DOMAIN}&public_site=Yes&analytics=0' $VERBOSE_OPT"
}

function test_simple_upgrade() {
  echo "--- Running simple upgrade test ---"
  _vagrant_ssh "sudo yunohost app upgrade $APP_NAME --file '$APP_DIR' $VERBOSE_OPT"
}

function test_simple_backup() {
  echo "--- Running simple backup test ---"
  local BACKUP_DIR="$TESTS_DIR/backups"
  _vagrant_ssh "sudo yunohost backup create --ignore-hooks --no-compress --apps $APP_NAME --output-directory $BACKUP_DIR $VERBOSE_OPT"
}

function test_package_check() {
  #echo "--- Running package_check ---"
  #_vagrant_ssh "package_check/package_check.sh --bash-mode '$APP_DIR'"
  echo "--- Skipping package_check ---"
  echo "(Our custom Vagrant box is not able to run LXC containers yet)"
}

function teardown() {
  echo "--- Cleaning up ---"
}

_parse_args $*
setup
test_simple_install
test_simple_upgrade
test_simple_backup
test_package_check
teardown
