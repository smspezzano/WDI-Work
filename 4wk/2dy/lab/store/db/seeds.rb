# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


products = []
products << Product.create(name: 'Stove', price: 198.99)
products << Product.create(name: 'Microwave', price: 39.99)
products << Product.create(name: 'Fridge', price: 599.89)
products << Product.create(name: 'Heater', price: 389.80)
products << Product.create(name: 'Air Conditioning', price: 259.99)
products << Product.create(name: 'Dutch Oven', price: 49.99)
products << Product.create(name: 'Fry Pan', price: 25.89)


categories = []
categories << Category.create(name: 'Appliances')
categories << Category.create(name: 'Kitchen')
categories << Category.create(name: 'Cooking')

categories[0].products << products[0]
categories[0].products << products[1]
categories[0].products << products[2]
categories[0].products << products[3]
categories[0].products << products[4]

categories[1].products << products[0]
categories[1].products << products[1]
categories[1].products << products[2]
categories[1].products << products[5]
categories[0].products << products[6]

categories[2].products << products[5]
categories[2].products << products[6]
