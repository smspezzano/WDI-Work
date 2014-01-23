require 'typhoeus'


response = Typhoeus.get("http://www.omdbapi.com/", :params => {:t => "Cars", :y =>2006 })

puts response.body
