# == Schema Information
#
# Table name: clubs
#
#  id          :bigint           not null, primary key
#  description :text
#  founded     :date
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
FactoryBot.define do
  factory :club do
    name { Faker::Sports::Basketball.team }
    founded { Time.now }
    description { Faker::Lorem.paragraph(sentence_count: 5) }
  end
end
