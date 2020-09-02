FactoryBot.define do
  factory :book do
  title { Faker::Book.title }
  author { Faker::Book.author }
  description { Faker::Lorem.paragraphs }
  page_count { rand(50..5000) }
  published { Faker::Date.backward }
  genre { 1 }
  user
  end
end
