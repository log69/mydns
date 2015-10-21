# mydns

simple ruby script for dns to avoid the need for a dynamic dns service provider, usage:

run server script on server side at boot

run client script with domain name parameter periodically from client machine, example:

script "hello"

run client script with domain name starting with a question mark for name resolution, so server answers back with matching ip address

script "?hello"
127.0.0.1
