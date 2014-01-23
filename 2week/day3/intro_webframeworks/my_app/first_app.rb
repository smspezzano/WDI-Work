require 'sinatra'
require "sinatra/reloader"

get "/" do
	"Hello, world"
end

get '/hello' do
  "Hello World"
end

# this will take anything you type after / and enter into name
# this is all encompassing, SO if you say get /hello/something below this
# it won't run 
get "/hello/:name" do
	"Hello, #{params[:name]}"
end

get '/blah' do
	"blah"
end


