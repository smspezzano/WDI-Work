#this is a comment from class
#correct_number = Random.new
random_number = Random.new.rand(1..100)
puts random_number

puts "Guess a number between 1 and 100!"
guess = gets.chomp.to_i
tries = 1 
# only when testing insert this [puts random_number]

while guess != random_number
  tries += 1
  if guess  < random_number
	puts "The number is higher that #{guess}. Guess again."
	guess= gets.chomp.to_i
  else 
	puts "The number is lower than #{guess}. Guess again."
	guess= gets.chomp.to_i
  end
end

puts "You got it in #{tries} try(s)"	
