#!/usr/bin/env ruby
# info: simple custom dns server, client side script
#       it updates its public IP address for the name periodically
# platform: all
# depends: none
# requirements: ruby 1.8+
# website: https://github.com/log69/mydns
# copyright: Andras Horvath <mail@log69.com>
# license: GPLv3+

$SAFE = 2

require 'socket'


host = "localhost"
port = 3333
wait = 60 # time to wait between every update in seconds

name = ARGV[0]
loop do
	server = TCPSocket.new(host, port)
	server.puts name
	if name[0..0] == "?"
		puts server.gets[/^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$/]
		break
	end
end

server.close
