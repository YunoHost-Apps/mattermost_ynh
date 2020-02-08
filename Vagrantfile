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

  config.vm.define :ynhtests
  config.vm.box = "yunohost-stretch-unstable"
  config.vm.box_url = "https://build.yunohost.org/yunohost-stretch-unstable.box"

  # Disable auto updates checks. Run `vagrant outdated` to perform manual updates.
  config.vm.box_check_update = false

  # Configuration for the vagrant-disksize plugin.
  # We need more space because package_check will create many LXC containers and snapshots.
  #
  # IMPORTANT: when re-creating the VM from scratch, the logical size of the disk will
  # still be 10 Go.
  # You'll need a live GParted ISO to resize partitions and fix it.
  config.disksize.size = '20GB'

  # Force guest type, because YunoHost /etc/issue can't be tuned
  config.vm.guest = :debian

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network "forwarded_port", guest: 80,  host: 8080
  # config.vm.network "forwarded_port", guest: 443, host: 8443

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network "private_network", ip: "192.168.33.10"

  # Use the NAT hosts DNS resolver. Fixes slow network in the guest.
  # See https://serverfault.com/questions/495914/vagrant-slow-internet-connection-in-guest
  #config.vm.provider "virtualbox" do |v|
  #  v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
  #  v.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
  #  v.customize ["modifyvm", :id, "--nictype1", "virtio"]
  #end

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  config.vm.synced_folder "./", "/vagrant",
    owner: "root",
    group: "sudo",
    mount_options: ["dmode=775,fmode=774"]

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  config.vm.provision "shell", privileged: false, keep_color: true, inline: <<-SHELL
    DOMAIN=ynhtests.local
    YUNOHOST_ADMIN_PASSWORD="alpine"

    # Stop on first error
    set -e

    if ! [[ -f /etc/yunohost/installed ]]; then
      # Upgrade Yunohost and the system packages
      sudo apt-get update
      sudo apt-get upgrade --yes
      # Run dist-upgrade twice, as the first Yunohost upgrade may fail
      sudo apt-get dist-upgrade --yes || sudo apt-get dist-upgrade --yes

      # Finish Yunohost installation
      sudo yunohost tools postinstall --domain ${DOMAIN} --password ${YUNOHOST_ADMIN_PASSWORD} --ignore-dyndns
    fi

    # Install package_check
    if ! [ -f "$HOME/package_check/package_check.sh" ]; then
      git clone https://github.com/YunoHost/package_check

      # Fix LXC containers not being able to reach outside internet.
      # The default configuration is to detect the default gateway used
      # by the Vagrant machine to configure LXC containers.
      # Unfortunately this results in the LXC containers not being able
      # to connect to the Internet.
      echo "dns=8.8.8.8" > $HOME/package_check/config
    fi

    # Build the initial LXC container
    if ! hash lxc-start 2>/dev/null || [ "$(sudo lxc-ls | wc -l)" == "0" ]; then
      # Build the default LXC container
      $HOME/package_check/sub_scripts/lxc_build.sh

      # Ensure the LXC container is correctly configured
      $HOME/package_check/sub_scripts/lxc_check.sh
    fi
  SHELL
end
