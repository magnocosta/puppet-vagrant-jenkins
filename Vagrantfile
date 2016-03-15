# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

   config.vm.provision :shell, :path => 'http://bit.ly/1vgzLDC'
   config.vm.box = 'precise64'
   config.vm.box_url = 'http://files.vagrantup.com/precise64.box'

   config.vm.provider "virtualbox" do |v|
    v.memory = 2048
    v.cpus = 2
    v.customize [
      "setextradata", :id,
      "VBoxInternal/Devices/ahci/0/LUN#[0]/Config/IgnoreFlush", "1"
    ]
   end

   # thanks: http://jeremykendall.net/2013/08/09/vagrant-synced-folders-permissions/

  config.vm.define :jenkins do |config|
    config.vm.network :private_network, :ip => "192.168.33.14"
    config.vm.network :forwarded_port, guest: 8080,    host: 8081   #jenkins
    config.vm.provision "puppet" do |puppet|
      puppet.module_path = "modules"
      puppet.manifest_file = "server.pp"
    end
  end
  
end
