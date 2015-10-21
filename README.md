# mydns

##simple ruby script for dns to avoid the need for a dynamic dns service provider

run server script on server side at boot

run client script with domain name parameter periodically from client machine that we want to reach, example:

script "hello"

run client script with domain name starting with a question mark for name resolution, so server answers back with matching ip address

script "?hello"
