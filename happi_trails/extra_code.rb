
# I created this in an attempt to put all the animals in an array
# but then I figured out that I could use @animals[ans_1.to_i]
# to access the animal array 
# create an array to store the choices 
		# animal_choices = [] 
		# @animals.each_with_index do animal, ind| 
		# animal_choices << (["#{animal.name}, #{animal.age}, #{animal.gender}, #{animal.species}, #{animal.toy}"])
		# end
		# This is for testing 
		# p animal_choices


# I created this in an attempt to put all the clients in an array
# but then I figured out that I could use @clients[ans_2.to_i]
# to access the client array 
# @clients.each_with_index do client, ind| 
		# picked_client << (["#{client.name}"])
		# end

# this was an attempt to make sure what was entered was an animal
# in the system
	# if animal_choices[ans.to_i].nil?
		# 	puts "I did not understand that"
		# end
		# clients_animal = animal_choices[ans.to_i]



# this was an attempt to update the client's info with the new animal
# and the client's number of animals
# answ = gets.chomp
		# picked_client = animal_choices[ans.to_i]
		# This is for testing 
		# p picked_client
		# @clients[ans_2.to_i].map! do element 
		# 	(element == @animal) ? clients_animal : element
		# end

# An attempt to create a better loop when adopting an animal
	# get response
	# check if response against @animal array with .include?(response)
	# check against an array of client's names ONLY
	# if happy_shelter.clients_name.include?(respnse)
	# else run methods to create client
	# enter pets name = response2
	# if pets name .include?(reponse2)
	# else run methods to create aniaml
