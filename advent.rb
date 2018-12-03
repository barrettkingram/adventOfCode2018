#!/usr/bin/env ruby
Dir["./lib/**/*.rb"].each { |f| require f }

day, part, input_file = ARGV[0], ARGV[1], ARGV[2]
print "Day #{day}, Part #{part}: "
klass = Object.const_get("Day#{day}")
puts klass.public_send("part#{part}", File.read(input_file))
