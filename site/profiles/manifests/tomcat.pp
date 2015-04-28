# Setup tomcat on a centos box
class profile::tomcat {

  if $::osfamily == 'redhat' {

    include ::tomcat
    include ::epel

    tomcat::instance { 'default':
      install_from_source => false,
      package_name        => 'tomcat',
      require             => Class['epel'],
    }

    tomcat::service { 'default':
      use_jsvc     => false,
      use_init     => true,
      service_name => 'tomcat',
      require      => Tomcat::Instance['default'],
    }
  }

}
