# Basic simple_node role
class roles::simple_node {

  include profiles::ntp
  include profiles::firewall
  include profiles::inifile
  include profiles::java

}
