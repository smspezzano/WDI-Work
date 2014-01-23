class Square < Shape

	def presentation 
		if @corners=4 && @sides = 4
		puts "I am a square because I have #{@corners} corners and #{@sides} sides"
		else 
			puts "I am not a square!"
		end
	end
end