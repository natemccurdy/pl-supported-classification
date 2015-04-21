# Use the puppetlabs/registry module
class profiles::windows::registry {

  $notice_caption = hiera('registry::notice_caption', 'LISTEN UP')
  $notice_text    = hiera('registry::notice_text', 'SHOULD YOU BE HERE?')

  registry::value { 'Legal notice caption':
    key   => 'HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System',
    value => 'legalnoticecaption',
    data  => $notice_caption,
  }

  registry::value { 'Legal notice text':
    key   => 'HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System',
    value => 'legalnoticetext',
    data  => $notice_text,
  }

  registry::value { 'Allow Windows Update to Forcibly reboot':
    key   => 'HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU',
    value => 'NoAutoRebootWithLoggedOnUsers',
    type  => 'dword',
    data  => '0',
  }

}
