# mydns

### Simple ruby script for custom name resolution
*The idea is to run the script on a server with fix IP address that can store and serve IP addresses of machines to avoid the need for an external dynamic dns service provider.*

*It serves the data from memory, so no database backend needed, no external dependencies either.*

*Don't forget to open the chosen port on the server and replace the host name value in the client script with the host server's domain name.*

*It's also a good idea for security reasons to run this script with a non-privileged user in a separated environment if possible.*

### Usage:
Run server script on server side at boot time.

**mydns_server.rb**

Run client script on client machines at boot time with a name parameter, this goes into an infinite loop updating the IP address periodically.

**mydns_client.rb hello**

Run client script with name parameter starting with a question mark for name resolution, so server answers back with the matching IP address if it exists.

**mydns_client.rb ?hello**

### Requirements:
Ruby 1.8+
