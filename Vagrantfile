ENV['VAGRANT_DEFAULT_PROVIDER'] = 'virtualbox'

require 'vagrant-auto_network'
require 'vagrant-pe_build'
require 'vagrant-hosts'

Vagrant.configure(2) do |config|

  config.vm.box = "puppetlabs/ubuntu-14.04-64-nocm"
  config.pe_build.version = '3.7.2'
  config.pe_build.download_root = 'https://s3.amazonaws.com/pe-builds/released/:version'


  config.vm.define "master" do |master|
    master.vm.hostname = "master.method346.net"
    master.vm.network "private_network", auto_network: "true"
    master.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id,
                   "--memory", "5100",
                   "--cpus",   "4",
                   "--ioapic", "on"
      ]
    end

    $color_prompt = <<SCRIPT
      sed -i 's/#force_color_prompt=yes/force_color_prompt=yes/' /root/.bashrc
      sed -i 's/#force_color_prompt=yes/force_color_prompt=yes/' /home/vagrant/.bashrc
SCRIPT
    master.vm.provision "shell", inline: $color_prompt

    master.vm.provision :hosts
    master.vm.provision :pe_bootstrap do |pe|
      pe.role = :master
    end

    $add_vagrant_to_modulepath = <<SCRIPT
    sudo puppet apply --modulepath=/vagrant/modules -e "ini_setting { 'set modulepath':
      path    => '/etc/puppetlabs/puppet/puppet.conf',
      section => 'main',
      setting => 'basemodulepath',
      value   => '/vagrant/modules:/vagrant/classificaion:/etc/puppetlabs/puppet/modules:/opt/puppet/share/puppet/modules'
    }"
SCRIPT
    master.vm.provision "shell", inline: $add_vagrant_to_modulepath

  end

end
