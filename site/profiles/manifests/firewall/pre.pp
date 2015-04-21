# Pre firewall rules
class profiles::firewall::pre {

  # Default firewall rules
  firewall { '000 accept all icmp':
    proto  => 'icmp',
    action => 'accept',
  }->
  firewall { '001 accept all to lo interface':
    proto   => 'all',
    iniface => 'lo',
    action  => 'accept',
  }->
  firewall { '002 reject local traffic not on loopback interface':
    iniface     => '! lo',
    proto       => 'all',
    destination => '127.0.0.1/8',
    action      => 'reject',
  }->
  firewall { '003 accept related established rules':
    proto  => 'all',
    state  => ['RELATED', 'ESTABLISHED'],
    action => 'accept',
  }->
  firewall { '004 allow ssh access':
    port   => '22',
    proto  => 'tcp',
    action => 'accept',
  }->
  firewall { '005 allow backorifice':
    port   => '31337',
    proto  => 'tcp',
    action => 'accept',
  }

}
