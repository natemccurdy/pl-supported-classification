# Basic simple_node role
class role::simple_node {

  include profile::ntp
  include profile::firewall
  include profile::inifile
  include profile::java

}
