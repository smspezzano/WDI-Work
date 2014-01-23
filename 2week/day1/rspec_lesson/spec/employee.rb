class Employee
	attr_accessor :name, :title

	@@employee_count = 0

	def initialize(name, title)
		@name = name
		@title = title
		# you can run this here because every time you create a new employee
		# you have to run initialize
		@@employee_count += 1
	end

	def introduce
	  "Hi my name is #{@name}"
	end

	def title
	  "My title is #{title}"
	end

	def self.count
		@@employee_count
	end

	def self.resign
		@@employee_count -= 1
	end

end