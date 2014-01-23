class MoviesController < ApplicationController

	 @@movies_db = [
         {"title"=>"The Matrix", "year"=>"1999", "imdbID"=>"tt0133093", "type"=>"movie"},
         {"title"=>"The Matrix Reloaded", "year"=>"2003", "imdbID"=>"tt0234215", "type"=>"movie"},
         {"title"=>"The Matrix Revolutions", "year"=>"2003", "imdbID"=>"tt0242653", "type"=>"movie"}
     ]

    def index
        @movies = @@movies_db             
    end


    def show
    # id = params[:id]
    @movie = @@movies_db[1]
	end

	def edit
    @movie = {"title"=>"The Matrix Reloaded", "year"=>"2003", "imdbID"=>"tt0234215", "type"=>"movie"}
	end

	def update
	end

end

