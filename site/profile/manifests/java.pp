# Use the puppetlabs/java module to install JRE or JDK.
# Taken from https://github.com/puppetlabs/puppetlabs-java/tree/master/tests
class profile::java {

  class { '::java':
    distribution => 'jre',
  }

}
