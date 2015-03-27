require 'puppet_forge'

# Example of a module from an internal repo co-existing with forge modules.
#mod 'splunk',
#  :git => 'https://internal.git.server/example/puppet-splunk.git',
#  :commit => '3ca47046a86aef9fbfdf58cc7b418d8e7254ecb9'

def add_supported_modules
  PuppetForge::Module.where( supported: 'true' ).unpaginated.each do |supported|
    mod "#{supported.owner.username}/#{supported.name}"
  end
end

add_supported_modules

# Install dependencies for all the supported modules
mod 'nanliu/staging'
