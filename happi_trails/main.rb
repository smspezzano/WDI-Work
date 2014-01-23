require './animal.rb'
require './client.rb'
require './shelter.rb'

# create 3 animals and 3 clients here to start with and make testing easier

start_animals = (
	spazzy = Animal.new("Spazzy", 12, "Male", "Cat","catnip, yarn"),
	sparkles = Animal.new("Sparkles", 5, "Female", "Dog", "ball, stick"),
	carl = Animal.new("Carl", 2, "Male", "Cat", "scratch post")
)

start_clients = (
	spencer = Client.new("Spencer", 0, 24, 0),
	michael = Client.new("Michael", 2, 45, 1, carl),
	john = Client.new("John", 1, 62, 1, (Animal.new("Max", 2, "Male", "Dog", "scratch post")))
)

# create new shelter here
happy_shelter = Shelter.new(start_clients, start_animals)
# happy_shelter.add_animal(start_animals)
# happy_shelter.add_client(start_clients)


def menu message
  # puts `clear`
  puts "*** Happy Trails v1.0 ***\n\n"

  puts "#{message}\n\n" unless message.empty?

  puts '1 : Add animal'
  puts '2 : Add client'
  puts '3 : Show all animals in shelter'
  puts '4 : Show all clients in system'
  puts '5 : Facilitate client adopts an animal'
  puts '6 : Facilitate client puts an animal up for adoption'
  puts "q : Quit\n\n"
  print '--> '
  gets.chomp
end


message = ""
choice = menu message
while choice != 'q'
  message = ""
  case choice
  	# create new animal
  when "1"
    puts "Please enter the animal's name:"
    name_animal = gets.chomp.capitalize
    puts "Please enter the animal's age:"
    age_animal = gets.chomp
    puts "Please enter the animal's gender:"
    gender = gets.chomp.capitalize
    puts "Please enter the animal's species:"
    species = gets.chomp.capitalize
    puts "Please enter each toy that this animal has followed by a comma:"
    toys = gets.chomp
    puts "Here are the animal's toys #{toys}"
    # create new instance of Animal class
    new_animal = Animal.new(name_animal, age_animal, gender, species, toys)
    # run method to add animal to shelter
    happy_shelter.add_animal(new_animal)
    # update display message
    message += new_animal.new_animal_message
  when "2"
    puts "Please enter the clients name:"
    name_client = gets.chomp
    puts "Please enter the number of children the client has:"
    num_children = gets.chomp
    puts "Please enter the age of the client:"
    age_client = gets.chomp
    puts "Please enter the number of pets a client has:"
    num_pets = gets.chomp
    # create new instance of Client class
    new_client = Client.new(name_client, num_children, age_client, num_pets)
    # run method to add client to shelter
    happy_shelter.add_client(new_client)
     # update display message
    message += new_client.new_client_message
  when "3"
    puts "Here are all the animals in the shelter:\n"
    happy_shelter.show_animals
    message += "All animals above."
  when "4"
    puts "Here are all the clients in the system:\n"
    happy_shelter.show_clients
    message += "All clients above."
  when "5"
  	happy_shelter.adopt
  when "6"
  	puts "So you want to put up an animal for adoption!"
  	puts "Please enter the animal's name:"
    name_animal = gets.chomp.capitalize
    puts "Please enter the animal's age:"
    age_animal = gets.chomp
    puts "Please enter the animal's gender:"
    gender = gets.chomp.capitalize
    puts "Please enter the animal's species:"
    species = gets.chomp.capitalize
    puts "Please enter each toy that this animal has followed by a comma:"
    toys = gets.chomp
    puts "Here are the animal's toys #{toys}"
    # create new instance of Animal class
    new_animal = Animal.new(name_animal, age_animal, gender, species, toys)
    # run method to add animal to shelter
    happy_shelter.add_animal(new_animal)
  	message += new_animal.put_up_message
  else
      message += "I don't understand ..."
  end
  choice = menu message
end

   
