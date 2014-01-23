#     days_of_the_week = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
# a = days_of_the_week.pop 
#   days_of_the_week.unshift(a)
#   puts days_of_the_week


    # def greet()
    #     greeting = "Hello!" + welcome()
    # end

    # def welcome()
    #     welcoming  = "Welcome to the event." + direct_to_seat()
    # end

    # def direct_to_seat()
    #     "Please take a seat"
    # end

    # puts greet()


#  def right_answer
#     puts "What is the last name of one the staring Warriors?"
#     answr = gets.chomp.capitalize
#     warr = ["Curry", "Lee", "Thompson", "Iguodala", "Bogut"] 
#     if warr.include?(answr)
#          puts "You are a true member of Dubnation!"        
#     end
#     until warr.include?(answr)
#      puts"Try again!"
#      answr = gets.chomp.capitalize
#       if warr.include?(answr)
#          puts "You are good at Googeling!"        
#       end
#     end
# end

# right_answer

def swap(arr, sw1, sw2)
    puts "I am going to swap your arr now"
    arr.each |i|
        if i == sw1 
            arr.pop



end

def swap(arr, sw1, sw2)
    puts "I am going to swap your array now"
    arr[sw1], arr[sw2] = arr[sw2], arr[sw1]
    p arr
end

swap([1,2,3], 0, -1)
 
# swap([1,2,3], 1, 0)





# 

# def my_func()
#             puts "going down 1!"
#             my_second_func()
#             puts "going up 1!"
#         end
        
#         def my_second_func()
#             puts "going down 2!"
#             my_third_func()
#             puts "going up 2!"
#         end
        
#         def my_third_func()
#             puts "going down 3"
#             puts "going up 3"
#         end
 
#         my_func()

