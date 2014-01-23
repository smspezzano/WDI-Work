class Shelter

	attr_accessor :clients, :animals
	
	def initialize(clients, animals)
		@clients = clients
		@animals = animals
	end

	def add_animal(new_anm)
		@animals << new_anm
		@animals
	end

	def add_client(new_cli)
		@clients << new_cli
		@clients
	end

	def show_animals
		# p @animals
		@animals.each_with_index do |animal, i| 
			# i+=1
			puts "#{i}: Name - #{animal.name}, Species - #{animal.species}, Age - #{animal.age}"
		end
	end

	def show_clients
		# For testing
		# @clients.each {|client| p client}
		@clients.each_with_index do |client, i| 
			# i+=1
			puts "#{i}: Name - #{client.name}, Number of children - #{client.num_children}, Age - #{client.age}, Number of pets - #{client.num_pets}"
		end
	end

	def adopt
		# Start the process of adopting an animal
		puts "So you want to adopt an animal, you are a great person!"
		# Display all available animals in the system
		@animals.each_with_index do |animal, i| 
			puts "#{i}: Name - #{animal.name}, Species - #{animal.species}, Age - #{animal.age}"
		end
		# Grab the animal being adopted and set it equal to ans_1
		puts "Above are the available animals we have. Please pick the animal you\nwant by typing the number next to the animal you want."
		ans_1 = gets.chomp
		# Access the client that is adopting a pet
		clients_animal = @animals[ans_1.to_i]
		# This is for testing 
		p clients_animal
		puts "Which client is this animal going to?"
		@clients.each_with_index do |client, i|
			puts "#{i}: Name - #{client.name}"
		end
		puts "Above are the available clients in our system. Please pick the client you\nwant by add the animal to by typing the number next to the client you want."
		ans_2= gets.chomp
		picked_client = @clients[ans_2.to_i]
		# This is for testing 
		# p picked_client
		# The next 2 lines add the animal to the client's info and update
		@clients[ans_2.to_i].animals = clients_animal
		@clients[ans_2.to_i].num_pets +=1
		# This is for testing 
		# p @clients	
		# remove the adopted animal from the shelter
		@animals.delete_at(ans_1.to_i)
		puts "Adoption successful!"	
	end

end


