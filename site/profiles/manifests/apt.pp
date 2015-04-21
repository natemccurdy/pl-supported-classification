# Do some things with puppetlabs/apt
class profiles::apt {

  if $::osfamily == 'Debian' {
    class { '::apt':
      always_apt_update => true,
    }

    # Example declaration of an Apt PPA
    apt::ppa { 'ppa:openstack-ppa/bleeding-edge': }

    # Declare Apt key for apt.puppetlabs.com source
    apt::key { 'puppetlabs':
      key         => '4BD6EC30',
      key_server  => 'pgp.mit.edu',
      key_options => 'http-proxy="http://proxyuser:proxypass@example.org:3128"',
    }
    apt::source { 'puppetlabs':
      location   => 'http://apt.puppetlabs.com',
      repos      => 'main',
      key        => '4BD6EC30',
      key_server => 'pgp.mit.edu',
    }

    # Add this to our Concat example
    profiles::motd::register{ 'Puppetlabs/Apt': }

  }

}

