FactoryBot.define do
  factory :club do
    name { Faker::Sports::Basketball.team }
    founded { Time.now }
    description { Faker::Lorem.paragraph(sentence_count: 5) }
  end
end