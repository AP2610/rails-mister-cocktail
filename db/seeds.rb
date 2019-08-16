# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'json'
# require 'pry'

# Whenever you seed, always remember to destroy all the existing data of that Model

Ingredient.destroy_all

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredients_serialized = open(url).read
result = JSON.parse(ingredients_serialized)
ingredients = result['drinks'].map { |ingredient| ingredient['strIngredient1'] }

5.times do
  Ingredient.create(name: ingredients.sample)
end

Cocktail.create(name: 'Mojito')

url = "https://unsplash.com/search/photos/mojito"
cocktail = Cocktail.new(title: 'Mojito', photo: "A great cocktail")
cocktail.remote_photo_url = url
cocktail.save
