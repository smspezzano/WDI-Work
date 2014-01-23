require 'sinatra'
require 'sinatra/reloader'
require 'typhoeus'
require 'json'
require 'pry'
require 'pg'



class Movie
    attr_accessor :title, :year, :id

  def initialize(new_title="", new_year="", new_id="")
      @title = new_title
      @year = new_year
      @id = new_id
  end
end

# A mehtod that can create the table for us 
def create_movies_table
  c = PGconn.new(:host => "localhost", :dbname => "test")
  c.exec %q{
  CREATE TABLE movies (
    id PRIMARY KEY,
    title TEXT,
    description TEXT,
    rating INTEGER
  );
  }
  c.close
end

# A method that will get rid of the table
def drop_movies_table
  c = PGconn.new(:host => "localhost", :dbname => "testdb")
  c.exec "DROP TABLE products;"
  c.close
end

# here I set the variable 'result' equal to a get request run through Typhoeus
# the request is going to omdbapi and passing in the entered string as a parameter
def omdb_pull(search_key, search_val)

  result = Typhoeus.get("http://www.omdbapi.com/", :params => {search_key => search_val})
  result = JSON.parse(result.body)
  result

end



get '/' do

  erb :index
end

post '/result' do
search_str = params[:movie]
 
 result = omdb_pull(:s, search_str)
 # I pass the ['Search'] key to strip the first layer of the respons
 result = result['Search']
 # here I am sorting the response by the movie year
 # I do this by using the 'sort_by' method and assigning |movie| to each movie hash
 # then I get the movie year by looking for the 'Year' key within each hash and 
 # convert it to an integer because it is a string
 result = result.sort_by {|movie| movie["Year"].to_i}

  # use for testing to inspect items
  # binding.pry 
  movies = []
  result.each { |movie| movies << Movie.new(movie["Title"], movie["Year"], movie["imdbID"]) }
  @movie_list = movies
  # binding.pry
  erb :shows

  # here call another get request passing in the imdbID and replace what is in the movies array with what is returned 
  # because here we get all the info. 
  # this way you can get all the posters at once
end

get '/poster/:imdb' do |imdb_id|

  result = omdb_pull(:i, "#{imdb_id}")

  @individual_movie = result
  # binding.pry

  erb :individual 

end

get '/movies' do

  c = PGconn.new(:host => "localhost", :dbname => "testdb")
  @movie_list= c.exec_params("SELECT * FROM movies;")
  c.close
  erb :movies
end

