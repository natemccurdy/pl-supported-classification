# Setup the host firewall using puppetlabs/firewall
# Pulled from https://github.com/puppetlabs/puppetlabs-firewall#create-firewall-rules
class profile::firewall {

  resources { 'firewall':
    purge => true,
  }

  Firewall {
    before  => Class['profile::firewall::post'],
    require => Class['profile::firewall::pre'],
  }

  class { ['profile::firewall::pre', 'profile::firewall::post']: }

  include ::firewall

  profile::motd::register{ 'Puppetlabs/firewall': }

}
