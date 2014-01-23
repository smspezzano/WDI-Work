class CreaturesController < ApplicationController

	def home
		render :home
	end

	def index
		@creatures = Creature.all
		render :index
	end

	def create
		creature = params.require(:creature).permit(:name, :description)
		new_creature = Creature.create(creature)
		redirect_to "/creatures/#{new_creature.id}"
	end

	def show
		id = params[:id]
		@creature = Creature.find(id)
		render :show
	end

	def edit
		id = params[:id]
		@creature = Creature.find(id)
		render :edit
	end

	def update
		id = params[:id]
		creature = Creature.find(id)
		updated_info = params.require(:creature).permit(:name, :description)
		creature.update_attributes(updated_info)
		redirect_to "/creatures/#{creature.id}"
	end

	def delete 
		id = params[:id]
		Creature.find(id).destroy
		redirect_to "/"
	end

end