require "rack"

#rack works by taking an array of 3 things
# define a class that takes what we want and rack interacts with the server
class HelloWorld

	def call(env)
		# content type needs to be capitalized 
		# 3rd argument has to be an array
		[200, {"Content-Type" => "text/html"}, ["Hello World!!!"]]
	end
end

# rack is middle layer, WEBrick is the server
# pass in a new instance of our class HelloWorld, and the port AKA the params
Rack::Handler::WEBrick.run HelloWorld.new, :Port => 8000