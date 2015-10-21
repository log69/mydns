#!/usr/bin/env ruby

$SAFE = 2

require 'socket'


name = ARGV[0]

server = TCPSocket.new("localhost", 3333)
server.puts name
puts server.gets[/^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$/] if name[0] == "?"

server.close
