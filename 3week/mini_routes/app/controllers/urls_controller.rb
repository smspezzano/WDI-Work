class UrlsController < ApplicationController
   before_filter :signed_in_user, only: [:create, :new, :edit]
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
		@url.increment!(:count, by = 1)
	end

	def small
		random_string = params[:random_string] 
		@url = Url.find_by(random_string: random_string)
		@url.increment!(:count, by = 1)
		#binding.pry
	end

	def site(url) 
		u = URI.parse(url.link)
			if(!u.scheme)
    			url.link = "http://#{url.link}"
    		end
	end

	def edit
		id = params[:id]
    	url = Url.find(id)
    	updated_info = params.require(:url).permit(:random_string)
    	#binding.pry
    		if Url.find_by(random_string: params[:url][:random_string])
				flash[:warning]="That short URL already exists! Please enter a different short URL:"
			else
				url.update_attributes(updated_info)
			end
    	redirect_to action: :show
	end

	helper_method :site

end
