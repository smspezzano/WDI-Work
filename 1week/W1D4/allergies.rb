#Title: Gluten Free
 
#Prerequisites:
#- Ruby
#    - Exceptions
#    - Hashes & Arrays
#    - Objects & Classes
 
#Objectives:
#- Work with exceptions, classes, class variables, conditions
 
"======================================================================"
 
# Create a Person class. A person will have a stomach and allergies
# Create a method that allows the person to eat and add arrays of food to their stomachs
# If a food array contains a known allergy reject the food.
 
# pizza = ["cheese", "gluten", "tomatoes"]
# pan_seared_scallops = ["scallops", "lemons", "pasta", "olive oil"]
# water = ["h", "h", "o"]

class AllergyERR < ArgumentError

end

class Person

	# initialize my class variables of the person's allergy, name, and stomach
	def initialize(allergy, name)
		@stomach = []
		@allergy = allergy
		@name = name
	end

	# create a method where the user "eats" the food
	# check if the food coming in contains a person's allergy
	# if allergy is present, empty the stomach and raise error
	# if no allergy is present, put the food in the stomach
	def eat(food)
		unless food.include?(@allergy)
			@stomach.push(food)
			puts "#{@name}, you ate #{@stomach.pop}" 
		else
			begin
 			@stomach = []
			raise AllergyERR.new("AllergyERR!!! #{@name} threw up! You shouldn't have eaten the #{@allergy} in #{food}, now your stomach is #{@stomach}!!")
		end
		end
			rescue AllergyERR => err
				 puts "#{err}"	
			end
end


pizza = ["cheese", "gluten", "tomatoes"]
pan_seared_scallops = ["scallops", "lemons", "pasta", "olive oil"]
water = ["h", "h", "o"]

# put all food in a single array, to randomize the order of the food
food = [pizza, pan_seared_scallops, water]

chris = Person.new("gluten", "Chris")

puts "*"*50

chris.eat(food.shuffle.pop)
chris.eat(food.shuffle.pop)
chris.eat(food.shuffle.pop)

puts "*"*50

beth = Person.new("scallops", "Beth")

beth.eat(food.shuffle.pop)
beth.eat(food.shuffle.pop)
beth.eat(food.shuffle.pop)



# Create a Person named Chris. Chris is allergic to gluten.
# Create a Person named Beth. Beth is allergic to scallops.
# Feed them the following foods

# When a person attempts to eat a food they are allergic to, raise a custom exception
# For example:  AllergyError
 
# Bonus: When a person attempts to eat a food they are allergic to,
#        ... remove ALL the food from the person's stomach before raising the exception

 

