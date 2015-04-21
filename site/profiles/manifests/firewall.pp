# Setup the host firewall using puppetlabs/firewall
# Pulled from https://github.com/puppetlabs/puppetlabs-firewall#create-firewall-rules
class profiles::firewall {

  resources { 'firewall':
    purge => true,
  }

  Firewall {
    before  => Class['profiles::firewall::post'],
    require => Class['profiles::firewall::pre'],
  }

  class { ['profiles::firewall::pre', 'profiles::firewall::post']: }

  include ::firewall

  profiles::motd::register{ 'Puppetlabs/firewall': }

}
