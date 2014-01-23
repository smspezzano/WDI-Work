require 'sinatra'
require 'sinatra/reloader'
require 'typhoeus'
require 'json'
require 'pry'



# class Movie
#     attr_accessor :title, :year, :id

#   def initialize(new_title="", new_year="", new_id="")
#       @title = new_title
#       @year = new_year
#       @id = new_id
#   end
# end

# def imdb_pull(search_key, search_val)

#   result = Typhoeus.get("http://www.omdbapi.com/", :params => {search_key => search_val})
#   result = JSON.parse(result.body)
#   result

# end
# MOVIES = []

get '/' do

  erb :index
end

post '/result' do
  search_str = params[:movie]

  # here I set the variable 'response' equal to a get request run through Typhoeus
  # the get request is going to omdbapi and passing in the entered string as a parameter
  response = Typhoeus.get("http://www.omdbapi.com/", :params => {:s => "#{search_str}"})
  # here I set the variable 'result' equal to running the response from omdbapi through JSON to make it a ruby element
  # also I pass the ['Search'] key to strip the first layer of the response
  result = JSON.parse(response.body)['Search']
  # here I am sorting the response by the movie year
  # I do this by using the 'sort_by' method and assigning |movie| to each movie hash
  # then I get the movie year by looking for the 'Year' key within each hash and 
  # convert it to an integer because it is a string
  result = result.sort_by {|movie| movie["Year"].to_i}

  # use for testing to inspect has been returned so far
  # could run result, etc.
  # binding.pry 

  # result.each { |movie| MOVIES << (h["Title"], h["Year"], h["imdbID"]) }
  movie_list_all = []
  result.each { |movie| movie_list_all << (movie["Title"], movie["Year"], movie["imdbID"]) }
  @movie_list = movie_list_all
  # @movie_list = result
  binding.pry
  erb :shows
end

get '/poster/:imdb' do |imdb_id|

  # here I am making another request and my param is the imdbID of each movie in the list
  response = Typhoeus.get("http://www.omdbapi.com/", :params => {:i => "#{imdb_id}"})
  result = JSON.parse(response.body)

  @individual_movie = result
  # binding.pry

  erb :individual 

end

