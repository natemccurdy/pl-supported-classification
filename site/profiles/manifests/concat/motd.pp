# Set a MOTD of all install modules with puppetlabs/concat.
class profiles::concat::motd (
  $motd = '/etc/motd'
) {

  validate_absolute_path($motd)

  concat { $motd:
    owner => 'root',
    group => 'root',
    mode  => '0644'
  }

  concat::motd::fragment{ 'motd_header':
    target  => $motd,
    content => "\nPuppet modules on this server:\n\n",
    order   => '01'
  }

  # let local users add to the motd by creating a file called
  # /etc/motd.local
  concat::motd::fragment{ 'motd_local':
    target => $motd,
    source => '/etc/motd.local',
    order  => '15'
  }
}
