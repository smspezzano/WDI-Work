class Person

	# attr_reader :name, :age
	# attr_writer :name, :age

	attr_accessor :name, :age

	def initialize(name, age) # instance variable 
		# self.name = name
		# self.age = age
		@name = name
		@age = age
		
	# # def name # Getter/Reader method
	# # 	@name
	# # end

	# # Setter/Writer method for @name
	# def name=(other)
	# 	@name = other
	# end

	# # def age 
	# # 	@age
	# # end

	# def age=(other)
	# 	@age = other
	# end

end