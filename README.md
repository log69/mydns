# mydns

###simple ruby script for custom name resolution
the idea is to run the script on a server with fix ip address that can store and serve ip addresses of machines to avoid the need for an extermal dynamic dns service provider

it serves the data from memory, so no database backend needed, no external dependencies either

don't forget to open the chosen port on the server

###usage:###
run server script on server side at boot time

**mydns_server.rb**

run client script on client machines at boot time with a name parameter, this goes into an infinite loop updating the ip address periodically

**mydns_client.rb "hello"**

run client script with name parameter starting with a question mark for name resolution, so server answers back with the matching ip address if it exists

**mydns_client.rb "?hello"**

###requirements:###
ruby 1.8+
