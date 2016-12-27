#!/bin/bash

# This is a script for installing Vagrant and VirtualBox on Ubuntu for using the
# Vagrantfile.

# Run as root or with 'sudo'

export DEBIAN_FRONTEND=noninteractive

# Prepare for installing VirtualBox
echo 'deb http://download.virtualbox.org/virtualbox/debian '$(lsb_release -cs)' contrib' > /etc/apt/sources.list.d/virtualbox.list
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O - | apt-key add -
wget -q https://www.virtualbox.org/download/oracle_vbox.asc      -O - | apt-key add -

apt-get update

# Install VirtualBox and dkms (for ensuring that the VirtualBox host kernel
# modules are properly updated during a apt-get upgrade).
apt-get -y install virtualbox-5.1 dkms

# Install Vagrant
wget https://releases.hashicorp.com/vagrant/1.9.1/vagrant_1.9.1_x86_64.deb
dpkg -i vagrant_1.9.1_x86_64.deb
