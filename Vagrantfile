# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # CentOS 5 base box
  config.vm.box = "puppetlabs/centos-5.11-64-nocm"
  config.ssh.forward_agent = true
  config.ssh.forward_x11 = true
  
  # provision 
  config.vm.provision :shell, :privileged => false, :path => "install_miniconda.sh"
end
