# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "2048"
  end

  config.vm.provision :shell, path: "bootstrap.sh"

  config.vm.define "one" do |one|
    one.vm.network "private_network", ip: "192.168.1.101"
    one.vm.network :forwarded_port, host: 9200, guest: 9200
  end

  config.vm.define "two" do |two|
    two.vm.network "private_network", ip: "192.168.1.102"
  end

  config.vm.define "three" do |three|
    three.vm.network "private_network", ip: "192.168.1.103"
  end

  config.vm.define "four" do |four|
    four.vm.network "private_network", ip: "192.168.1.104"
  end



end
