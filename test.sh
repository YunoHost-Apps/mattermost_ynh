#!/bin/bash
# Run package_check tests against the app in the working directory on a Vagrant virtual machine.
#
# NB: Vagrant is used because package_check uses LXC containers, and Docker doesn't support running LXC.

# Fail on first error
set -e

# Configuration constants
APP_ID="mattermost"
APP_DIR="/vagrant"

function _usage() {
  echo "Run package_check tests against the app in the working directory on a Vagrant virtual machine."
  echo "Usage: test.sh [--verbose] [--help]"
}

# Configuration arguments
function _parse_args() {
  VERBOSE=false
  VERBOSE_OPT=''
  while [ "$1" != "" ]; do
    case $1 in
      "-v" | "--verbose")
        shift
        VERBOSE=true
        VERBOSE_OPT='--verbose';;
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

# Pre-download the app source archive declared in an app.src file.
# The local archive will be used during tests, instead of being re-downloaded every time.
#
# TODO: let package_check do the caching itself
function _cache_app_source() {
  local app_src="conf/app.src"
  if [ ! -e "conf/app.src" ]; then
    return
  fi

  local src_url=$(grep 'SOURCE_URL=' "$app_src" | cut -d= -f2-)
  local src_format=$(grep 'SOURCE_FORMAT=' "$app_src" | cut -d= -f2-)
  local src_filename=$(grep 'SOURCE_FILENAME=' "$app_src" | cut -d= -f2-)
  if [ "$src_filename" = "" ] ; then
    src_filename="app.${src_format}"
  fi

  local lxc_name="pchecker_lxc"
  local lxc_root="/var/lib/lxcsnaps/${lxc_name}/snap0/rootfs"
  local local_src_dir="${lxc_root}/opt/yunohost-apps-src/${APP_ID}"

  local file_exists=false
  _vagrant_ssh "sudo test -e ${local_src_dir}/${src_filename}" && file_exists=true

  if [ "$file_exists" = false ]; then
    echo "--- Downloading and caching app source ---"
    _vagrant_ssh " \
      sudo mkdir -p ${local_src_dir} && \
      sudo wget -O ${local_src_dir}/${src_filename} ${src_url};";
  fi
}

function setup() {
  echo "--- Setting up Vagrant VM ---"
  vagrant up --provision
  _cache_app_source
}

function test_package_check() {
  echo "--- Running package_check ---"
  _vagrant_ssh "package_check/package_check.sh --bash-mode '$APP_DIR'"
}

function abort() {
  trap - SIGINT SIGTERM
  echo "--- Aborting ---"
  if (vagrant status | grep -q "running"); then
    echo "Removing package_check lock…"
    _vagrant_ssh "rm -f package_check/pcheck.lock"
  fi
  teardown
}
trap abort SIGINT SIGTERM

function teardown() {
  echo "--- Cleaning up ---"
}

_parse_args $*
setup
test_package_check
teardown
