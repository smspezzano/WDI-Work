class Client

	attr_accessor :name, :num_children, :age, :num_pets, :animals

	def initialize(name, num_children, age, num_pets, animals=[])
		@name = name
		@num_children = num_children
		@age = age
		@num_pets = num_pets
		@animals = animals
	end

	def new_client_message
		"The client's info that was just created is: name - #{@name}, number 
		of children - #{@num_children } age - #{@age}, number of pets - 
		#{@num_pets}, animals (if any) - #{@animals}"
	end


end