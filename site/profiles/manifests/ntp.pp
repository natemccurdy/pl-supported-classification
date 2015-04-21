# Setup an NTP client.
class profiles::ntp {

  class { '::ntp':
    servers  => ['time-a.nist.gov', 'time-b.nist.gov'],
    restrict => [
      'default ignore',
      '-6 default ignore',
      '127.0.0.1',
      '-6 ::1',
      'time-a.nist.gov nomodify notrap nopeer noquery',
      'time-b.nist.gov nomodify notrap nopeer noquery'
    ],
  }

  # Add this to our Concat example
  profiles::motd::register{ 'Puppetlabs/ntp': }

}
