#!/usr/bin/env ruby

$SAFE = 2

require 'socket'


port = 3333

# listen on socket
s = TCPServer.new port
db = []

loop do
	Thread.start(s.accept) do |c|

		# get domain name and source ip address
		# sanitize input strongly
		name = c.gets[/[\?]*[a-z]+/][0..15]
		ip = c.addr[-1][/^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$/]

		# question mark makes it a request for name resolution
		# command is ?name
		if name[0] == "?"

			# send back last ip from db
			i = db.index(name[1..-1])
			ip = ""
			ip = db[i+1] if i
			c.puts ip

		else

			# name exists?
			i = db.index(name)
			if i
				# name already exists, so update the ip
				db[i+1] = ip
			else
				# name does not exist, so store name and ip
				db += [name, ip]

				# secure db from flood by limiting the number
				# of its entries
				db = db[0..255]
			end

		end
	end
end
