<!---	In the view <br>

	<%if @show_greeting %>

		<%= @greeting %>, world
	<% else %>
		Hello World
	<% end %> 
--------->


# localhost:4567/?greeeting=hello
	greeting = params[:greeting]
	# '@' is very important, allows us to set it in the index.erb file
	@show_gretting = true
	@greeting = greeting
	# the name tells the program to open up that file and not
	# another erb file