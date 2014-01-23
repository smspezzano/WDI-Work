# Require webrick, whcich is the server
require "webrick"

# get the path for the server, using the relative(. = current) directory specified
root = File.expand_path(".") # makes relative path to absolute path
# instantiate new webrick server
# and pass it 2 paramas
# :Port = where we navigate to in our web browser, the port we'll access
	# a location the computer connects to on the server
	# lots of port numbers
server = WEBrick::HTTPServer.new({:Port => 8000, :DocumentRoot => root})
# Go to locaclhost:8000


# takes block and uses that to know how it will respond to this server being accessed
# we have to define response
# .body
server.mount_proc "/hello" do |req, res|
	res.body = "Hello, world! #{req}"
end

trap "INT" do
	server.shutdown
end
server.start