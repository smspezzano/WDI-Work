story_hash = {
  "question" => "Welcome to the haunted hotel. What room would you like to go to?",
  "room 1" => "you're dead",
  "room 2" => { "question" => "You picked a good room. What would you like to do?",
  "sleep" => "You're rested for the morning",
  "stay up all night" => "You might have anxiety issues." 
	}
}


class Adventure

  # start by taking a hash
  # using the hash we will prompt the user for
  # input and change the story accordingly

	# initialize the hash
	def initialize(story_hash)
		@story_hash = story_hash
	end

	# puts out question and valid available options 
	# and get response
	def prompt(question, options)
		# puts "this the the prompt method"
		puts question
		puts "#{options}"
		res = gets.chomp
	end

	# puts out corresponding options
	def prompt_n_chomp(question, options)
		# puts "this the the prompt_n_chomp method"
		res = prompt(question, options)

		# if user did not enter a correct response tell user to 
		# try again
		until options.include?(res)
			puts "Your response was invalid"
			# puts "this the the prompt_n_chomp method"
			res = prompt(question, options)
		end
		res
	end

	def get_options(curr_story_hash)
		# puts "this is the get_options method"
		curr_story_hash.keys.select { |x| x != "question" }
	end

	# starting our adventure
	# initialize story_hash
	# each time we go through the hash it will get smaller,
	# so when we start we want to start with the full hash
	# we want to grab the current hash for that part of the story
	# curr_story_hash will contain the current question and get smaller
	# and "smaller" as the story continues = traversing a hash
	def start()
		# puts "this is the start method"
		curr_story_hash = @story_hash
		question = @story_hash["question"]
		options = get_options(curr_story_hash)

		until options.nil?
			res = prompt_n_chomp(question, options)
			
			# if its a hash = more options
			if curr_story_hash[res].is_a?(Hash)
				curr_story_hash = curr_story_hash[res]
				question = curr_story_hash["question"]
				options = get_options(curr_story_hash)
			# no hash = end of story
			else
				puts curr_story_hash[res]
				options = nil
			end
		end
	end

	"End of story!"
end



adv = Adventure.new(story_hash)
adv.start()