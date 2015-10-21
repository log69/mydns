# mydns

###simple ruby script for name resolution to avoid the need for an extermal dynamic dns service provider
the idea is to run the script on a server with fix ip address that can store and serve ip addresses of machines

it serves the data from memory, so no database backend needed, no external dependencies

###usage:###
run server script on server side at boot time

**mydns_server.rb**

run client script on client machines with a name parameter periodically

**mydns_client.rb "hello"**

run client script with name parameter starting with a question mark for name resolution, so server answers back with the matching ip address if it exists

**mydns_client.rb "?hello"**

###requirements:###
ruby 1.8+
