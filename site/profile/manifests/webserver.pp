# Create some websites with puppetlabs/apache
class profile::webserver (
  $docroot = '/var/www/site'
){

  # Base class. Turn off the default vhosts; we will be declaring
  # all vhosts below.
  class { '::apache':
    default_vhost => false,
  }

  include ::apache::mod::php

  file { $docroot:
    ensure => directory,
    mode   => '0755',
  }

  apache::vhost { 'site.example.com':
    servername => 'site.example.com',
    port       => '80',
    docroot    => $docroot,
  }

  # Add this to our Concat example
  profile::motd::register{ 'Puppetlabs/Apache': }

}
