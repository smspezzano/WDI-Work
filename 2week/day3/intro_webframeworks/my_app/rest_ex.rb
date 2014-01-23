require 'sinatra'
require "sinatra/reloader"

MY_USERS = [ {name: "John"}, {name: "Jane"}]

# return a list of users
get "/users" do
	users = ''
	# hypothetically HTML could go in that string
	MY_USERS.each {|user| users+= "<h2>#{user[:name]}</h2> <br>"}
	users
end

get "/users/:id" do
	 id = params[:id].to_i
	 MY_USERS[id][:name]
end