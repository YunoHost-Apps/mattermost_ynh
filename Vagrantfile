# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  config.vm.define :mattermost_ynh
  config.vm.box = "debian/contrib-jessie64"

  # Disable auto updates checks. Run `vagrant outdated` to perform manual updates.
  config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network "forwarded_port", guest: 80,  host: 8080
  # config.vm.network "forwarded_port", guest: 443, host: 8443

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network "private_network", ip: "192.168.33.10"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  config.vm.synced_folder "./", "/vagrant"

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  config.vm.provision "shell", privileged: false, keep_color: true, inline: <<-SHELL
    TESTS_DIR="/home/vagrant/tests"
    APP_DIR="$TESTS_DIR/mattermost_ynh"
    VM_ROOT_PASSWORD="alpine"
    YUNOHOST_ADMIN_PASSWORD="alpine"

    # Stop on first error
    set -e

    # Upgrade the system packages
    #DEBIAN_FRONTEND=noninteractive sudo apt-get update
    #DEBIAN_FRONTEND=noninteractive sudo apt-get upgrade --yes -o Dpkg::Options::='--force-confdef' -o Dpkg::Options::='--force-confold'

    # Install git
    hash git 2>/dev/null || sudo apt-get install git --yes

    # Install Yunohost
    if ! hash yunohost 2>/dev/null; then
      git clone https://github.com/YunoHost/install_script /tmp/install_script
      yes ${VM_ROOT_PASSWORD} | sudo passwd
      cd /tmp/install_script
      echo "Running Yunohost install script…"
      sudo ./install_yunohost -a
      sudo yunohost tools postinstall --domain mattermost-ynh.local --password ${YUNOHOST_ADMIN_PASSWORD}
    fi

    # Install lxc
    if ! hash lxc-start 2>/dev/null; then
      DEBIAN_FRONTEND=noninteractive sudo apt-get update
      DEBIAN_FRONTEND=noninteractive sudo apt-get install --yes --fix-missing lxc
    fi

    # Install package_check
    if ! [ -f "$HOME/package_check/package_check.sh" ]; then
      git clone https://github.com/YunoHost/package_check
    fi
  SHELL
end
