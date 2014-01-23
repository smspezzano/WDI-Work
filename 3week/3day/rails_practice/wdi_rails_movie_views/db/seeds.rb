# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Movie.create([
          {title: "The Matrix", year: "1999", imdbID: "tt0133093"},
          {title: "The Matrix Reloaded", year: "2003", imdbID: "tt0234215"},
          {title:"The Matrix Revolutions", year: "2003", imdbID: "tt0242653"}])
