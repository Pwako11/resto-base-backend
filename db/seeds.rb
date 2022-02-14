# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Product.destroy_all

User.create(name: "Patrick", username: "PAkolo", email: "PAkolo@hotmail.com", password: "password")
User.create(name: "Jane", username: "JDoe", email: "JDoe@hotmail.com", password: "password")

Product.create(user_id: 1, name: "burger", price: 5, description: "beef patty, burns, cheese, pickle, ketchup")