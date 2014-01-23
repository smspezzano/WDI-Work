require 'json'

movies = JSON.parse({
Search: [
{
Title: "You Are the Apple of My Eye",
Year: "2011",
imdbID: "tt2036416",
Type: "movie"
},
{
Title: "The Apple Dumpling Gang",
Year: "1975",
imdbID: "tt0072653",
Type: "movie"
},
{
Title: "The Apple",
Year: "1998",
imdbID: "tt0156901",
Type: "movie"
},
{
Title: "The Apple Dumpling Gang Rides Again",
Year: "1979",
imdbID: "tt0078790",
Type: "movie"
},
{
Title: "The Apple War",
Year: "1971",
imdbID: "tt0068025",
Type: "movie"
},
{
Title: "The Apple",
Year: "1980",
imdbID: "tt0080380",
Type: "movie"
},
{
Title: "The Apple",
Year: "1967",
imdbID: "tt0708452",
Type: "episode"
},
{
Title: "An Apple Red as Blood",
Year: "2012",
imdbID: "tt2104524",
Type: "episode"
},
{
Title: "Bad Apple",
Year: "2004",
imdbID: "tt0383902",
Type: "movie"
},
{
Title: "God, Sex & Apple Pie",
Year: "1998",
imdbID: "tt0176774",
Type: "movie"
}
]
}
.to_json)

sorted = movies['Search']
sorted.sort_by {|k,v| k}

 
puts sorted