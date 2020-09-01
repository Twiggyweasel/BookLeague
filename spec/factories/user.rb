FactoryBot.define do
  factory :user do
  first_name { Faker::Name.first_name }
  last_name { Faker::Name.last_name }
  username { Faker::Internet.email }
  password { Faker::Lorem.characters(number: 10) }
  end
end