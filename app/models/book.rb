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
class Book < ApplicationRecord
  GENRE_VALUES = %w[Fantasy Horror Mystery SciFi Thriller]
  enum genre: GENRE_VALUES
  
  belongs_to :user
  has_many :recommendations

  validates :title, presence: true, length: { in:  6..75 }
  validates :author, presence: true
  validates :description, presence: true
  validates :genre, presence: true
end
