class UrlsController < ApplicationController

	def index
		@url = Url.new
	end

	# def new
  		
	# end

	def create 
		new_url = params.require(:url).permit(:link)
		new_url["random_string"] = SecureRandom.urlsafe_base64(14)
		new_url["count"] = 0
		url = Url.create(new_url)
		render action: :show
	end

	def show
		id = params[:id]
		@url = Url.find(id)
	end

	def update
		link = params[:id]
		updated_info = params.require(:url).permit(:count + 1)
		@url = Url.find(link)
		@url.update_attributes(updated_info)
		redirect_to url_path(@url.id)
	end

end
