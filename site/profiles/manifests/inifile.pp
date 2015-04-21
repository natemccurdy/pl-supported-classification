# Modify some files with puppetlabs/inifile
class profiles::inifile {

  $file_path = hiera(inifile_test, '/tmp/foo.ini')

  Ini_setting {
    require => File[$file_path],
  }

  # Drop in a file to manipulate
  file { $file_path:
    ensure => file,
    mode   => '0666',
    source => 'puppet:///modules/profiles/inifile_test.ini',
  }

  ini_setting { 'change owner name':
    ensure  => present,
    path    => $file_path,
    section => 'owner',
    setting => 'name',
    value   => 'Bruce Wayne',
  }

  ini_setting { 'change owner organization':
    ensure  => present,
    path    => $file_path,
    section => 'owner',
    setting => 'organization',
    value   => 'Wayne Enterprises',
  }

  ini_setting { 'change database prt':
    ensure  => present,
    path    => $file_path,
    section => 'databse',
    setting => 'port',
    value   => '31337'
  }
}
