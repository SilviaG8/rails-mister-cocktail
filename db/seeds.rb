require 'open-uri'
require 'json'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
list_serialized = open(url).read
data = JSON.parse(list_serialized)

Ingredient.destroy_all

data["drinks"].each do |i|
  Ingredient.create(name: i["strIngredient1"])
  puts "Created #{i["strIngredient1"]}"
end

Cocktail.create(name: "Mojito")
Cocktail.create(name: "Old Fashion")
