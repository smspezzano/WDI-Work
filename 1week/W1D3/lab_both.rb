# Instructions are written inline.
 
# docs you may enjoy
# http://www.ruby-doc.org/core-2.0/Hash.html
# http://ruby-doc.org/core-2.0/String.html
# http://ruby-doc.org/core-2.0/Array.html
 
# Every Morning I make a smoothie with the follow ingredients:
smoothie_ingredients = {
  'flax seeds' => '1 tbsp',
  'chia seeds' => '1 tbsp',
  'coconut flakes' => '1 tbsp',
  'spirulina' => '1 tsp',
  'pumpkin seeds' => '1 tbsp',
  'oatmeal' => '1/4 cup',
  'coco powder' => '1 tbsp',
  'peanut butter' => '1 tbsp',
  'almonds' => '1/4 cup',
  'walnuts' => '1/4 cup',
  'spinach' => '1/4 cup',
  'greek yogurt' => '1/4 cup',
  'nutrional yeast' => '1 tbsp',
  'brussel sprouts' => '1/4 cup',
  'asparagus' => '1/4 cup',
  'kale' => '1/4 cup',
  'brocoli rabe' => '1/4 cup',
  'blue berries' => '1/4 cup',
  'chopped banana' => '1/2 cup',
  'straw berries' => '1/4 cup',
  'mango' => '1/4 cup',
  'hemp milk' => '1 cup'
}
 
# Write a function called blend.
# It should take all the smoothie ingredients (not the measurements) and chop up and mix all the characters
# and output a mixed string of characters
# Be sure to remove the spaces, as we don't want any air bubbles in our smoothie!
 

# def blend(smoothie_ingredients)
  
#   mixed_ingredients = smoothie_ingredients.keys.sample(4).join.delete(" ").split("").shuffle.join
#   puts "Here is your smoothie: #{mixed_ingredients}!"
  
# end

# blend(smoothie_ingredients)

# Use this to as a test [p just_ingredients]

  # mixed_ingredients = just_ingredients.join.delete(" ").split("").shuffle.join


# just_ingredients = []
  # smoothie_ingredients.each_key { |k| just_ingredients.push("#{k}") }

# mixed_ingredients = just_ingredients.each {|item| item.split("").shuffle}
  # p mixed_ingredients

 # p mixed_ingredients.strip.split("").shuffle.join

# mixed_ingredients_no_ws = mixed_ingredients.strip
# mixed_ingredients_no_ws.split("").shuffle.join()

# p mixed_ingredients_no_ws

  # mixed_ingredients.join.shuffle

  # p mixed_ingredients

    # mixed_ingredients = ""
  # i = 0
  # until just_ingredients.empty?
  #    just_ingredients.pop(i) 
  #    mixed_ingredients += i
  #    i +=1
  # end

  # mixed_ingredients = ""
  # until just_ingredients.empty?
  #     a=just_ingredients.pop 
  #    mixed_ingredients += a
  # end
 
 
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



# things to add, how to turn blender off, need to create an instance variable
# for the switch 
# add method for start AND end
# then after blend call the end method

class Blender


  # attr_ accessor :ingredients, :switch
  def initialize(ingredients)
    @ingredients = ingredients
    # @switch = false
  end

  def smoothie_ingredients
     mixed_ingredients = @ingredients.join.delete(" ").split("").shuffle.join
     puts mixed_ingredients 
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



 # while res != "no" && res != "yes"
    #   puts "Blender not on. Put blender on? [yes OR no]"
    #   res = gets.chomp
    #   if res == "yes"
    #     smoothie_ingredients
    #     stop
    #   elsif res == "no"
    #     # puts "Blender not on. Put blender on? [yes OR no]"
    #   else
    #     puts "Invalid response. No smoothie for you!"
    #   end
    # end

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