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
  local exit_code=$?
  return $exit_code
}

function _assert_success() {
  local message="$1"
  local command="$2"
  if [ -z "$command" ]; then
    echo "Invalid arguments: command missing."
    echo "Usage: _assert_success <message> <command>"
    return -1
  fi

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

function _assert_mattermost_frontpage_up() {
  local domain="$1"

  # On the default Yunohost Vagrant box, this file
  # bypass all SSOWAT configurations, and redirects the root of the domain to the SSO login form.
  # We need to access the frontpage, so we remove this bypass.
  _vagrant_ssh "sudo rm -f /etc/ssowat/conf.json.persistent"

  _assert_success \
    "Mattermost frontpage is reachable" \
    "curl --silent --show-error --insecure -L -H 'Host: ${DOMAIN}' --resolve ${DOMAIN}:443:127.0.0.1 https://${DOMAIN}/ | grep -q 'Mattermost'"
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

function test_simple_install() {
  echo "--- Running simple installation test ---"
  _vagrant_ssh "sudo yunohost app install '$APP_DIR' --args 'domain=${DOMAIN}&public_site=Yes&analytics=0' $VERBOSE_OPT"
  _assert_mattermost_frontpage_up "$DOMAIN"
}

function test_simple_upgrade() {
  echo "--- Running simple upgrade test ---"
  _vagrant_ssh "sudo yunohost app upgrade $APP_NAME --file '$APP_DIR' $VERBOSE_OPT"
  _assert_mattermost_frontpage_up "$DOMAIN"
}

function test_simple_backup() {
  echo "--- Running simple backup test ---"
  _vagrant_ssh "sudo yunohost backup create --name mattermost-test-backup --ignore-system $VERBOSE_OPT --apps $APP_NAME"
}

function test_simple_remove() {
  echo "--- Running simple remove test ---"
  _vagrant_ssh "sudo yunohost app remove $APP_NAME"
}

function test_simple_restore() {
  echo "--- Running simple restore test ---"
  _vagrant_ssh "sudo yunohost backup restore mattermost-test-backup --force --ignore-system $VERBOSE_OPT --apps $APP_NAME"
  _assert_mattermost_frontpage_up "$DOMAIN"
}

function test_package_check() {
  echo "--- Running package_check ---"
  _vagrant_ssh "package_check/package_check.sh --bash-mode '$APP_DIR'"
}

function teardown() {
  echo "--- Cleaning up ---"
}

_parse_args $*
setup
test_package_check
test_simple_install
test_simple_upgrade
test_simple_backup
test_simple_remove
test_simple_restore
teardown
