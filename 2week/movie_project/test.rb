movie_list = [{"Title"=>"Amanda by Night",
  "Year"=>"1981",
  "imdbID"=>"tt0082004",
  "Type"=>"movie"},
 {"Title"=>"Amanda & the Alien",
  "Year"=>"1995",
  "imdbID"=>"tt0112339",
  "Type"=>"movie"},
 {"Title"=>"Amanda", "Year"=>"1996", "imdbID"=>"tt0115526", "Type"=>"series"},
 {"Title"=>"The Amanda Show",
  "Year"=>"1999–2002",
  "imdbID"=>"tt0217910",
  "Type"=>"series"}]

  movie_list.each do |movie|
  p	"#{movie['Year']}"
end
