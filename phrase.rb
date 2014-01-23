puts "Enter a phrase"
phrase = gets.chomp.split
phrase_array = phrase.map {|x| x.length}
puts phrase_array