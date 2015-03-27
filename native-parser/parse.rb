require 'puppet'
require 'puppet/parser'
require 'puppet/pops'

ARGV.each do |arg|

  if File.exist?(arg)
    file = File.read(arg)
    parser = Puppet::Pops::Parser::Parser.new()
    puts parser.parse_string(file)
  end

end
