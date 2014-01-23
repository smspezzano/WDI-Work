require 'sinatra'
require 'sinatra/reloader'

MY_DB = []

get "/"  do
	@animals = MY_DB
erb :index
# redirect "/animals"
end

# the INDEX METHOD/ROUTE for an Animal
get "/animals" do
	@animals = MY_DB

	erb :index
end

# the CREATE METHOD/ROUTE for an Animal
post "/animals" do
	# raise params.inspect
	# returned will be a hash, and it will be the animal hash
	animal = params[:animal]
	MY_DB << animal
	# go here after getting input from user

	id = MY_DB.length() -1
	redirect "/animals/#{id}"
end

# THE SWHO METHOD/ROUTE for 
get "/animals/:id" do
	id = params[:id].to_i
	# instantiate animals here 
	@animal = MY_DB[id]

	erb :shows
end


