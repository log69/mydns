#!/usr/bin/env ruby

$SAFE = 2

require 'socket'


host = "localhost"
port = 3333

name = ARGV[0]
server = TCPSocket.new(host, port)
server.puts name
puts server.gets[/^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$/] if name[0..0] == "?"

server.close
