class Animal

	attr_accessor :name, :age, :gender, :species, :toy

	def initialize(name, age, gender, species, toy)
		@name = name
		@age = age
		@gender = gender
		@species = species
		@toy = toy
	end

	def new_animal_message
		"The animal's info just created is: name - #{@name}, age - #{@age}, gender - \n#{@gender}, species - #{@species}, toy(s) - #{@toy}"
	end

	def put_up_message
		"The animal with this info was just put up for adoption: name - #{@name}, age - #{@age}, gender - 
		#{@gender}, species - #{@species}, toy(s) - #{@toy}"
	end
end