# == Schema Information
#
# Table name: recommendations
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  book_id    :bigint           not null
#  club_id    :bigint           not null
#
# Indexes
#
#  index_recommendations_on_book_id  (book_id)
#  index_recommendations_on_club_id  (club_id)
#
# Foreign Keys
#
#  fk_rails_...  (book_id => books.id)
#  fk_rails_...  (club_id => clubs.id)
#
class Recommendation < ApplicationRecord
  belongs_to :book
  belongs_to :club

  has_one :user, through: :book

  validates :book_id, :uniqueness => {:scope => :club_id}
end
