# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Photo.destroy_all
Category.destroy_all
Event.destroy_all
Profile.destroy_all
User.destroy_all

party = Category.create(name: "Party")
lecture = Category.create(name: "Lecture")
bootcamp = Category.create(name: "Bootcamp")

john = User.create!(email: "john@john.com", password: "123456")
tim = User.create!(email: "tim@tim.com", password: "123456")
san = User.create!(email: "san@san.com", password: "123456")

event_1 = Event.create!(name: "Partytime", description: "Fun party event", location: "Rotterdam",
price: 9.99, capacity: 99, includes_food: true, includes_drink: false, starts_at: DateTime.now+1,
ends_at: DateTime.now+10, active: true, user: john, categories: [bootcamp, lecture])

event_2 = Event.create!(name: "Lessontime", description: "Learn a lesson", location: "Amsterdam",
price: 7.99, capacity: 88, includes_food: true, includes_drink: false, starts_at: DateTime.now+1,
ends_at: DateTime.now+10, active: true, user: john, categories: [party, lecture])

event_3 = Event.create!(name: "Football Event", description: "Germany vs Holland", location: "Utrecht",
price: 19.99, capacity: 88, includes_food: true, includes_drink: false, starts_at: DateTime.now+1,
ends_at: DateTime.now+10, active: true, user: john, categories: [party, lecture])

# Photos

photo1 = Photo.create!(remote_image_url: "http://res.cloudinary.com/imagestorethingy/image/upload/v1507821795/pexels-photo-169391_majhad.jpg", event: event_1)
photo2 = Photo.create!(remote_image_url: "http://res.cloudinary.com/imagestorethingy/image/upload/v1507821772/pexels-photo-169209_kkfc5t.jpg", event: event_1)
photo3 = Photo.create!(remote_image_url: "http://res.cloudinary.com/imagestorethingy/image/upload/v1507821759/pexels-photo-262524_abye8v.jpg", event: event_1)

photo4 = Photo.create!(remote_image_url: "http://res.cloudinary.com/imagestorethingy/image/upload/v1507821744/pexels-photo-388238_bkqmfx.jpg", event: event_2)
photo5 = Photo.create!(remote_image_url: "http://res.cloudinary.com/imagestorethingy/image/upload/v1507821732/black-and-white-man-person-musician_oxobih.jpg", event: event_2)
photo6 = Photo.create!(remote_image_url: "http://res.cloudinary.com/imagestorethingy/image/upload/v1507821702/pexels-photo-270085_lhpa0v.jpg", event: event_2)

photo7 = Photo.create!(remote_image_url: "http://res.cloudinary.com/imagestorethingy/image/upload/v1507821690/firework-new-year-s-eve-december-31-fireworks_k2kesc.jpg", event: event_3)
photo8 = Photo.create!(remote_image_url: "http://res.cloudinary.com/imagestorethingy/image/upload/v1507821679/pexels-photo-399610_svd246.jpg", event: event_3)
photo9 = Photo.create!(remote_image_url: "http://res.cloudinary.com/imagestorethingy/image/upload/v1507821663/pexels-photo-169198_x7w8zh.jpg", event: event_3)
photo10 = Photo.create!(remote_image_url: "http://res.cloudinary.com/imagestorethingy/image/upload/v1507821640/pexels-photo-433452_wdnaxa.jpg", event: event_3)

# registrations

Registration.create!(event: event1, user: john, active: true, price: 100, guests_count: 2)
Registration.create!(event: event1, user: san, active: true, price: 50, guests_count: 3)
