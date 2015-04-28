# Use the powershell provider from puppetlabs/powershell
# Taken from https://forge.puppetlabs.com/puppetlabs/powershell#usage
class profile::windows::powershell {

  $new_guest = hiera('powershell::new_guest', 'plebian')

  exec { 'rename-guest':
    command   => template('profile/powershell/rename-guest.ps1.erb'),
    onlyif    => template('profile/powershell/guest-exists.ps1.erb'),
    provider  => powershell,
    logoutput => true,
  }

}
