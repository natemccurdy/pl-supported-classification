# Setup a mysql database server using puppetlabs/mysql
class profiles::mysql {

  $php  = hiera('mysql::bindings::php_enable',  false)
  $java = hiera('mysql::bindings::java_enable', false)
  $perl = hiera('mysql::bindings::perl_enable', false)
  $ruby = hiera('mysql::bindings::ruby_enable', false)

  validate_bool($php)
  validate_bool($java)
  validate_bool($perl)
  validate_bool($ruby)

  class { '::mysql::server':
    php_enable  => $php,
    java_enable => $java,
    perl_enable => $perl,
    ruby_enable => $ruby,
  }

}
