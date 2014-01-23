require 'sinatra'
require 'sinatra/reloader'
require 'typhoeus'
require 'json'
require 'pry'

get '/' do
  html = %q(
  <html><head><title>Movie Search</title></head><body>
  <h1>Find a Movie!</h1>
  <form accept-charset="UTF-8" action="/result" method="post">
    <label for="movie">Search for:</label>
    <input id="movie" name="movie" type="text" />
    <input name="commit" type="submit" value="Search" /> 
  </form></body></html>
  )
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
  
  html_str = "<html><head><title>Movie Search Results</title></head><body><h1>Movie Results</h1>\n<ul>"
  # here I run a loop on the array of movie hashes and use 'movie' as my variable
  # then I call each item I want by passing in the key
  # I also use the imbdID and place it in my link to be passed to the next get request
    result.each do |movie|
  html_str += "<a href=\"../poster/#{movie['imdbID']}\"><li>#{movie['Title']} - #{movie['Year']}</li></a>"
end
  html_str += "</ul></body></html>"
end

get '/poster/:imdb' do |imdb_id|

  # here I am making another request and my param is the imdbID of each movie in the list
  response = Typhoeus.get("http://www.omdbapi.com/", :params => {:i => "#{imdb_id}"})
  result = JSON.parse(response.body)

  html_str = "<html><head><title>Movie Poster</title></head><body><h1>Movie Poster</h1>\n"
  # make title equal to the title of the movie
  html_str += "<h3>#{result['Title']}</h3>"
  # have the poster image show up by passing in the poster url 
  html_str +="<img src=\" #{result['Poster']} \">"
  html_str += '<br /><a href="/">New Search</a></body></html>'

end

