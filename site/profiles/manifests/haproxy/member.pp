# A member of an HA proxy load-balancer
class profiles::haproxy::member (
  $port = '80',
) {

  @@haproxy::balancermember { $::fqdn:
    listening_service => 'apache-cluster',
    server_names      => $::hostname,
    ipaddresses       => $::ipaddress,
    ports             => $port,
    options           => 'check',
  }

}
