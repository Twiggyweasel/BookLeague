# == Schema Information
#
# Table name: books
#
#  id          :bigint           not null, primary key
#  author      :string
#  description :text
#  genre       :integer
#  page_count  :integer
#  published   :date
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_books_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
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
