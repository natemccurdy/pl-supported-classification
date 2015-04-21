# Use the powershell provider from puppetlabs/powershell
# Taken from https://forge.puppetlabs.com/puppetlabs/powershell#usage
class profiles::windows::powershell {

  $new_guest = hiera('powershell::new_guest', 'plebian')

  exec { 'rename-guest':
    command   => template('profiles/powershell/rename-guest.ps1.erb'),
    onlyif    => template('profiles/powershell/guest-exists.ps1.erb'),
    provider  => powershell,
    logoutput => true,
  }

}
