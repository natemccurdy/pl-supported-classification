# Create some java keystores with puppetlabs/java_ks
# Taken from https://github.com/puppetlabs-operations/puppetlabs-activemq/blob/master/manifests/ssl.pp
class profile::java_ks {

  $passwd    = hiera('java_ks::password', 'password')
  $configdir = hiera('amq_configdir', '/tmp')

  java_ks { 'puppetca:truststore':
    ensure       => latest,
    certificate  => "${::settings::ssldir}/certs/ca.pem",
    target       => "${configdir}/broker.ts",
    password     => $passwd,
    trustcacerts => true,
  }

  java_ks { 'puppetca:keystore':
    ensure       => latest,
    certificate  => "${::settings::ssldir}/certs/${::clientcert}.pem",
    private_key  => "${::settings::ssldir}/private_keys/${::clientcert}.pem",
    target       => "${configdir}/broker.ks",
    password     => $passwd,
    trustcacerts => true,
  }

}
