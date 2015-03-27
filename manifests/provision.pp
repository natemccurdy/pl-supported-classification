
if 'master' in $::hostname {
  ini_setting { 'set modulepath':
    path    => '/etc/puppetlabs/puppet/puppet.conf',
    section => 'main',
    setting => 'basemodulepath',
    value   => '/vagrant/modules:/vagrant/classificaion:/etc/puppetlabs/puppet/modules:/opt/puppet/share/puppet/modules',
  }
}

file_line { 'color root prompt':
  path  => '/root/.bashrc',
  line  => 'force_color_prompt=yes',
  match => 'force_color_prompt=yes',
}

file_line { 'color vagrant prompt':
  path  => '/home/vagrant/.bashrc',
  line  => 'force_color_prompt=yes',
  match => 'force_color_prompt=yes',
}
