# create a class called Blender
# It should have a method that takes an array of ingredients and returns a mixed string of characters.
# Give the blender an on and off switch and only allow the blender to function when it's on.
# FOR SAFETY'S SAKE When you create a new blender by default it should be off.
# Blend the the smoothie array
 
s_ingredients =["flax seeds", "chia seeds", "coconut flakes", "spirulina", "pumpkin seeds", 
  "oatmeal", "coco powder", "peanut butter", "almonds", "walnuts", "spinach", 
  "greek yogurt", "nutrional yeast", "brussel sprouts", "asparagus", "kale", 
  "brocoli rabe", "blue berries", "chopped banana", "straw berries", "mango", 
  "hemp milk"]



class Blender


  # attr_ accessor :ingredients, :switch
  def initialize(ingredients)
    @ingredients = ingredients
    # @switch = false
  end

  def smoothie_ingredients
     mixed_ingredients = @ingredients.join.delete(" ").split("").shuffle.join
     puts "Here is your smoothie! #{mixed_ingredients}" 
  end

  def stop()
    puts "Blender is off"
  end
 
  def start()
    stop
    puts "Ready to make a smoothie and turn blender on?: yes or no"
    res = gets.chomp

    if res == "yes"
      smoothie_ingredients
      stop
    else 
      puts "Invalid response. No smoothie for you!"
    end
   
    while res == "no"
      puts "Blender not on. Put blender on? [yes OR no]"
      res = gets.chomp
      if res == "yes"
        smoothie_ingredients
        stop
      elsif res == "no"
        # puts "Blender not on. Put blender on? [yes OR no]"
      else
        puts "Invalid response. No smoothie for you!"
      end
    end
  end
end



blend_me = Blender.new(s_ingredients)
blend_me.start()



# The other loops I tried running

# while res != "yes"
#       res = gets.chomp
#       if res == "yes"
#       smooothie_ingredients
#       elsif res == "no"
#         puts "Blender not on. Put blender on? [yes OR no]"
#       else
#         puts "Invalid response. No smoothie for you!"
#     end
#   end



# until res != "yes"
  #   puts "Blender not on. Put blender on? [yes OR no]"
  #   res = gets.chomp
  #   puts "res is:" + res
  #   if res == "yes"
  #    smooothie_ingredients
  #     puts "try again? [yes OR no]"
  #     res = gets.chomp
  #   end
  # end