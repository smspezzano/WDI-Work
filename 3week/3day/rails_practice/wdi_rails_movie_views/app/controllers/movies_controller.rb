class MoviesController < ApplicationController

  def home
  end

  # route: GET    /movies(.:format)
  def index
    @movies = Movie.all
    # binding.pry
    respond_to do |format|
      format.html
      format.json { render :json => @movies }
      format.xml { render :xml => @movies.to_xml }
    end
  end
  # route: # GET    /movies/:id(.:format)
  def show
    id = params[:id]
    @movie = Movie.find(id)
  end

  # route: GET    /movies/new(.:format)
  def new
  end

  # route: GET    /movies/:id/edit(.:format)
  def edit
   id = params[:id]
    @movie = Movie.find(id)
  end

  #route: # POST   /movies(.:format)
  def create
    # create new movie object from params
    movie = params.require(:movie).permit(:title, :year)
    movie["imdbID"] = ("tt" + rand(10000..100000000).to_s)
    # add object to movie db
    # binding.pry
    movie= Movie.create(movie)
    # show movie page
    # render :index
    redirect_to action: :index
  end

  # route: PATCH  /movies/:id(.:format)
 
   def update
    #implement
    # @@movie_db.delete_if do |movie|
    #   movie['imdbID'] == params[:id]
    # end
    id = params[:id]
    movie = Movie.find(id)
    updated_info = params.require(:movie).permit(:title, :year)
    movie.update_attributes(updated_info)
 
    redirect_to action: :index
  end

  # route: DELETE /movies/:id(.:format)
  def destroy
    #implement
    id = params[:id]
    # binding.pry
    Movie.find(id).destroy
    redirect_to action: :index  
  end

  def results
    @search_str = params[:movie]
    result = Typhoeus.get("http://www.omdbapi.com/", :params => {:s => @search_str})
    @result = JSON.parse(result.body)['Search']
     # binding.pry
    @result.each do |movie|
      mov = ({title: movie['Title'], year: movie['Year'], imdbID: movie['imdbID']})
      mov = Movie.create(mov)
    end
    @result
  end


end
