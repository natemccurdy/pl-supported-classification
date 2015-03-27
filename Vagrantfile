ENV['VAGRANT_DEFAULT_PROVIDER'] = 'virtualbox'

require 'vagrant-auto_network'
require 'vagrant-pe_build'
require 'vagrant-hosts'

Vagrant.configure(2) do |config|

  config.vm.box = "puppetlabs/ubuntu-14.04-64-nocm"
  config.pe_build.version = '3.7.2'
  config.pe_build.download_root = 'https://s3.amazonaws.com/pe-builds/released/:version'

  config.vm.define "master" do |m|
    m.vm.hostname = "master.vagrant"
    m.vm.network "private_network", auto_network: "true"
    m.vm.provider :virtualbox do |v|
      v.cpus = 4
      v.memory = 5120
      v.customize ["modifyvm", :id, "--ioapic", "on" ]
    end

    m.vm.provision :hosts

    m.vm.provision :pe_bootstrap do |pe|
      pe.role = :master
    end

    m.vm.provision "puppet" do |p|
      p.manifest_file = "provision.pp"
    end
  end
end
