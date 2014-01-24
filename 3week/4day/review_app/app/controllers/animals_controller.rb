class AnimalsController < ApplicationController

	def index
		@animals = Animal.all
    end

    def new
    	@animal = Animal.new
    end

    def create
    	new_animal = params.require(:animal).permit(:name, :species, :nickname, :age, :status, :description)
    	animal = Animal.create(new_animal)
        redirect_to animal_path(animal.id)
    end

    def show
    	id = params[:id]
    	@animal = Animal.find(id)
    end

    def edit
    	id = params[:id]
    	@animal = Animal.find(id)
    end

    def update
    	id = params[:id]
    	updated_info = params.require(:animal).permit(:name, :species, :nickname, :age, :status, :description)
    	@animal = Animal.find(id)
    	@animal.update_attributes(updated_info)
    	redirect_to animal_path(@animal.id)
    end

end
