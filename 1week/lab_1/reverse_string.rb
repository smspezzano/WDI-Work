=begin
puts "Enter a string"
input = gets.chomp

input.length.times {|letter| print input[-1-letter]}
=end
puts "Enter a string"
input = gets.chomp

puts input.length / 2
input_2 = input.length / 2
input_2.times { |i| input[i], input[-i-1] = input[-i-1], input[i]}
puts input

#This prints out the numbers of each letter 
#string.length.times {|letter| print letter}
#puts


=begin
count = 0
while count < string.length
	count += 1
	puts string[]

string.length.times do |i|
	print string[-1-i]
end

puts 
	



=end