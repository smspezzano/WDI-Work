puts "Please enter a phrase to be framed"
phrase = gets.chomp
puts "I am going to frame this"
max_word = phrase.split.max { |a, b|  a.length <=> b.length }

frame_top_bottom = (max_word.length + 4)
frame = (max_word.length + 1)

frame_top_bottom.times {print "*"}
puts
phrase.split.map {|word| puts "* " + word.ljust(frame) +  "*"}
frame_top_bottom.times {print "*"}
puts