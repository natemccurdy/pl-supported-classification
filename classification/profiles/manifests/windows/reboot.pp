#  An example of puppetlabs/reboot
class profiles::windows::reboot {

  if $::osfamily == 'windows' {

    # Install Git on Windows
    package { 'Git version Git-1.9.5-preview20150319.exe':
      ensure          => installed,
      source          => 'C:\git\Git-1.9.5-preview20150319.exe',
      install_options => ['/VERYSILENT'],
      provider        => windows,
      notify          => Reboot['after_run'],
    }

    # Then reboot
    reboot { 'after_run':
      apply => finished,
    }

  }

}
