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

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = "bento/ubuntu-16.04"

  # Provider-specific configuration for Parallels Desktop
  config.vm.provider "parallels" do |prl|
    # Set the virtual machine name that appears in the Parallels Desktop GUI.
    prl.name = "databrary"
    # Create VM as a Linked Clone:
    # * Linked clone creation is much faster than the full cloning because there
    #   is no image copying process.
    # * A linked clone requires much less disk space. Its hard disk image is
    #   less than 1 MB (bound to the parent's snapshot).
    # * A full clone is a full image copy, which is independent from the box.
    #   Linked clones are bound to the specific snapshot of the box image. It
    #   means that box deletion will cause all its linked clones being
    #   corrupted. Be careful when deleting your boxes!
    prl.linked_clone = true
    # Set the memory size and number of CPUs
    prl.memory = 2048
    prl.cpus = 2
  end

  # Enable provisioning with a shell script.
  config.vm.provision "shell", path: "setup.sh"
end
