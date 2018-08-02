require 'open-uri'
require 'json'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
data = JSON.parse(open(url).read)

data["drinks"].each { |ingredient| Ingredient.create(name: ingredient["strIngredient1"])}


