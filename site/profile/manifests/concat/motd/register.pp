# let other modules register themselves in the motd
define profile::concat::motd::register (
  $content = undef,
  $order   = '10',
) {

  if $content {
    $body = $name
  } else {
    $body = $content
  }

  concat::fragment { "motd_fragment_${name}":
    target  => '/etc/motd',
    order   => $order,
    content => "    -- ${body}\n"
  }

}
