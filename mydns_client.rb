#!/usr/bin/env ruby
# info: simple custom dns server, client side script
#       it updates its public ip address for the name periodically
# platform: all
# depends: none
# requirements: ruby 1.8+
# website: https://github.com/log69/mydns
# copyright: Andras Horvath <mail@log69.com>
# license: GPLv3+

$SAFE = 2

require "socket"


host = "localhost"
port = 3333
wait = 60 # time to wait between every update in seconds

name = ARGV[0].to_s
if name == "" then puts "error: specify a name"; exit 1 end

loop do
	s = TCPSocket.new(host, port)
	s.puts name
	# request for name resolution?
	if name[0..0] == "?"
		# get back source ip address
		# sanitize input strongly
		puts s.gets[/^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$/]
		s.close
		break
	end
	s.close

	sleep wait
end
