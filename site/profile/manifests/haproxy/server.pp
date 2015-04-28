# Setup an HA proxy load balancer
# Simple example from https://github.com/garystafford/garystafford-haproxy_node_config
#
class profile::haproxy::server {

  include ::haproxy

  haproxy::listen { 'apache-cluster':
    ipaddress => $::ipaddress,
    ports     => '80',
    mode      => 'tcp',
    options   => {
      'balance' => 'roundrobin',
    },
  }

  Haproxy::Balancermember <<| listening_service == 'apache-cluster' |>>

}
