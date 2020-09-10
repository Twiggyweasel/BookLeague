# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(email: "test@test.com", first_name: 'Richard', last_name: 
'Wise', password: 'test123')

15.times do
  Club.create(name: Faker::Sports::Basketball.team, founded: Faker::Date.backward, description: Faker::Lorem.paragraph)
end

3.times do 
  u = User.create(email: Faker::Internet.email, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, password: 'test123')
  Membership.create(club_id: 1, user_id: u.id, role: 0)
end

2.times do 
  u = User.create(email: Faker::Internet.email, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, password: 'test123')
  Membership.create(club_id: 1, user_id: u.id, role: 1)
end

10.times do 
  u = User.create(email: Faker::Internet.email, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, password: 'test123')
  Membership.create(club_id: 1, user_id: u.id, role: 2)
end

15.times do 
  page_count = rand(50..5000) 

  Book.create(title: Faker::Book.title, author: Faker::Book.author, description: Faker::Lorem.paragraphs, page_count: page_count, published: Faker::Date.backward, genre: 1, user_id: 1)
end