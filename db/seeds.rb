# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Event.destroy_all

party = Category.create(name: "Party")
lecture = Category.create(name: "Lecture")
bootcamp = Category.create(name: "Bootcamp")

john = User.create!(email: "john@john.com", password: "123456")
tim = User.create!(email: "tim@tim.com", password: "123456")
san = User.create!(email: "san@san.com", password: "123456")

Event.create!(name: "Partytime", description: "Fun party event", location: "Rotterdam",
price: 9.99, capacity: 99, includes_food: true, includes_drink: false, starts_at: DateTime.now+1,
ends_at: DateTime.now+10, active: true, user: john, categories: [bootcamp, lecture])

Event.create!(name: "Lessontime", description: "Learn a lesson", location: "Amsterdam",
price: 7.99, capacity: 88, includes_food: true, includes_drink: false, starts_at: DateTime.now+1,
ends_at: DateTime.now+10, active: true, user: john, categories: [party, lecture])
