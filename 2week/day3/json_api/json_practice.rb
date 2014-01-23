require 'json'

result = JSON.parse( '{"Animals":[ { "name": "Fluffy", "age": 5, "species": "dog"},
              { "name": "Buster", "age": 10, "species": "cat"},
              { "name": "Mochi", "age": 4, "species": "dog"},
              { "name": "Russel", "age": 5, "species": "dog"}
            ],
  "Clients":[ { "name": "Tim", "num_children": 0},
              { "name": "Angelina", "num_children": 6}
            ]
}')

# puts result.to_s

result['Animals'].each { |animal_hash| puts "#{animal_hash['name']} - #{animal_hash['age']} years old"}

# require 'json'


# result = JSON.parse('{ "name" : "Fluffy", "age": 5, "species" : "dog"}')

# puts result.to_s

# puts result['name']