pages_with_questions = {}
k = ""

# File.open("story_mine.txt", "r") do |infile|
#   while (line = infile.gets)
#    if line.include?("~p")
#     	k = line.chomp
#     	lines_grabbed = ""
#     else
#     	lines_grabbed += line
#     end
#        pages_with_questions[k] = lines_grabbed.chomp
#   end
# end



File.open("story_mine.txt", "r") do |infile|
  while (line = infile.gets)
    if line.include?("~p")
    	k = line.chomp
    	pages_with_questions[k] = ""
    else
    	 pages_with_questions[k] += line
    end
  end
end


# pages_with_questions.select do |k, value|
# 	puts "#{k}" + ":" + "#{value}"
# end

p1 = pages_with_questions.select do |k, value|
	k.include?("~p1")
end

p1.each do |k,v|
	puts v
end

puts
answer = gets.chomp.downcase
if answer == pages_with_questions["~p1:c1:p2"]
	puts pages_with_questions["~p2"]
	puts
elsif answer == pages_with_questions["~p1:c2:p3"]
	puts pages_with_questions["~p3"]
	puts
else
	puts pages_with_questions["~p4"]
	puts
end

puts "Want to play a different type of fantasy football??"
puts 

answer = gets.chomp.downcase

until answer.include?("no")
	p1 = pages_with_questions.select do |k, value|
	    k.index("~p1")
    end

    p1.each do |k,v|
	    puts v
    end

    answer = gets.chomp.downcase

    if answer.include?(pages_with_questions["~p1:c1:p2"])
	   puts pages_with_questions["~p2"]
	   puts "\nWant to play a different type of fantasy football??\n"

       answer = gets.chomp.downcase
    elsif answer.include?(pages_with_questions["~p1:c2:p3"])
	   puts pages_with_questions["~p3"]
	   
	   puts "Want to play a different type of fantasy football??\n"

      answer = gets.chomp.downcase
    else
	   puts pages_with_questions["~p4"]
	   puts "Want to play a different type of fantasy football??\n"

      answer = gets.chomp.downcase
    end
end


# p2 = pages_with_questions.select do |key, value|
# 	key.index("~p2")
# end

# p2.each do |k,v|
# 	puts v
# end

# p2 = pages_with_questions.select do |k, value|
# 	k.index("~p2")
# end

# p2.each do |k,v|
# 	puts v
# end



