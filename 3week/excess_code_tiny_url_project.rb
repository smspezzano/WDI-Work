<%= form_for @url, url: {action: "create"}, html: {class: "nifty_form"} do |f| %>
  <%= f.text_field :url %>
  <%= f.submit "Create" %>
<% end %>


<%= form_for :get, url: show_url_path do |f| %>
  <%= label_tag(:random_string, "Tiny URL:") %> <%= f.text_field :random_string, placeholder: "Type tiny URL here" ,value: @url['random_string'] %></br>
  <%= f.submit "Find" %>
<% end %>

<%= form_for :url, url: {action: "show"}, html: {class: "nifty_form"} do |f| %>
  <%= f.text_field :random_string %>
  <%= f.submit "Show" %>
<% end %>

<!-- <form  accept-charset="UTF-8" action="/urls/:id" method="get">
    	<div class="form-group">
    		<input class="form-control" placeholder="Tiny URL!" id="random_string" name="random_string" type="text" />
    	</div>
    	 <button name="commit" type="submit" class="btn btn-default">Submit</button>
</form> -->


<%= form_for :url, method: :get, url: show_url_path do |f| %>
  <%= label_tag(:random_string, "Tiny URL:") %> <%= f.text_field :random_string%></br>
  <%= f.submit "Find" %>
<% end %>



	# def self.all
	# 	Url.all
	# end


	def self.new
		@url = Url.new
	end

	def self.create
		new_url = params.require(:url).permit(:link, SecureRandom.urlsafe_base64(14), 1)
    	url = Url.create(new_url)
        redirect_to url_path(url.id)
	end

	def self.show
		@url = URL.find(params[:id])
	end

	def self.update
	
	end