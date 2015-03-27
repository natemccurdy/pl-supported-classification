# Including puppet-parse here makes 'parse' a valid rake task.
require 'puppet-parse/puppet-parse'

# The puppetlabs/apt modules causes puppet-parse to error out.
PuppetParse.configuration.ignore_paths = [
  "modules/apt/**/*.pp",
]

task :default do
  system "rake -T"
end

desc "Use r10k to download all supported modules from the Forge"
task :r10k do
  system "r10k puppetfile install -v"
end

desc "Run r10k and then parse the modules"
task :all do
  Rake::Task['r10k'].invoke
  Rake::Task['parse'].invoke
end
