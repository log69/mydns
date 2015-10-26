#!/usr/bin/env ruby
# info: simple custom dns server, server side script
#       it serves ip addresses for the requested names
# platform: all
# depends: none
# requirements: ruby 1.8+
# website: https://github.com/log69/mydns
# copyright: Andras Horvath <mail@log69.com>
# license: GPLv3+

$SAFE = 2

require "socket"
require "digest"


port  = 3333
maxip = 1000 # number of maximum ip entries

# listen on socket
s = TCPServer.new port
db = []

loop do
	c = s.accept

	# get domain name and source ip address
	# sanitize input strongly
	name = c.gets[/[\?]*[\.\-_a-zA-Z0-9]+/][0..100]
	ip = c.addr[-1][/^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$/]

	# question mark makes it a request for name resolution
	# command is ?name
	if name[0..0] == "?"

		# send back last ip from db
		i = db.index(name[1..-1])
		ip = ""
		if i
			# send real ip belonging to the name if it exists
			ip = db[i+1]
		else
			# send deterministic random data on failed lookups
			# to trick attackers using the hash of the name
			# so the attacker cannot figure out if the name is real
			h = Digest::SHA1.hexdigest(name[1..-1])
			ip = "#{h[0..1].to_i(16)}.#{h[2..3].to_i(16)}.#{h[4..5].to_i(16)}.#{h[6..7].to_i(16)}"
		end
		# send it
		c.puts ip

	else

		# name exists?
		i = db.index(name)
		if i
			# name already exists, so update the ip,
			db[i+1] = ip
		else
			# name does not exist, so store name and ip,
			# secure service from flood and avoid dos attack
			# by limiting the number of the entries
			# from the same source ip,
			db += [name, ip] if db.count(ip) < 10

			# secure service from dos attack
			# by limiting the number of maximum entries,
			db = db[0..maxip*2-1]
		end
	end
end
