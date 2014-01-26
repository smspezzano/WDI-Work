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
		# url = Url.create(new_url)
		url = Url.create_with(random_string: new_url["random_string"], count: new_url["count"]).find_or_create_by(link: new_url['link'])
		redirect_to url_path(url)
	end

	def show
		id = params[:id]
		@url = Url.find(id)
	end

	def small
		random_string = params[:random_string] 
		@url = Url.find_by(random_string: random_string)
		# (@url.count).to_i += 1
	end

	def site(url) 
	u = URI.parse(url.link)
		if(!u.scheme)
    		url.link = "http://#{url.link}"
    	end
	end

	def update
		link = params[:id]
		updated_info = params.require(:url).permit(:count + 1)
		@url = Url.find(link)
		@url.update_attributes(updated_info)
		redirect_to url_path(@url.id)
	end

	helper_method :site

end
