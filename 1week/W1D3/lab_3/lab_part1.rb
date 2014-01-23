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
 

def blend(smoothie_ingredients)
  
  mixed_ingredients = smoothie_ingredients.keys.sample(4).join.delete(" ").split("").shuffle.join
  puts "Here is your smoothie: #{mixed_ingredients}!"
  
end


# The extra steps I took to get to the method above
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
