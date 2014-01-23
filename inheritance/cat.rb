
require './animal'

class Cat < Animal

	def initialize(age, gender, name)
		@age= age
		@gender=gender
		@name=name
	end
end

c_1 = Cat.new(4 , "Black", "spencer")
c_1.speak