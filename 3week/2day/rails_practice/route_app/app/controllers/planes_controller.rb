#Planes controller
class PlanesController < ApplicationController
    
    def index
    	# set all planes equal to instance variable of @planes
    	@planes = Plane.all	
        render :index
    end
    
    def new
    	render :new
    end

    def create
    	# this is the params from the form, NEED THE SAME NAME
    	# require is convention and permit is a security feature 
    	# that allows user input to effect the db
    	plane = params.require(:plane).permit(:name, :engine_type, :description)
    	# need to create a variable to be able to get the id and redirect to it
    	new_plane = Plane.create(plane)
    	redirect_to "/planes/#{new_plane.id}"
    end

    def show
    	# grabbing the params ID that was passed in the URL
   		# accessing the db by passing in the id
    	id = params[:id]
    	@plane = Plane.find(id)
    	render :show
    end

    def edit
    	id = params[:id]
    	@plane = Plane.find(id)
    	render :edit
    end

    def update
    	id = params[:id]
    	plane = Plane.find(id)
    	updated_info = params.require(:plane).permit(:name, :engine_type, :description)
    	plane.update_attributes(updated_info)
    	redirect_to "/planes/#{plane.id}"
    end	
 end