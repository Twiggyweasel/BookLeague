# == Schema Information
#
# Table name: meetings
#
#  id         :bigint           not null, primary key
#  date       :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  club_id    :bigint           not null
#
# Indexes
#
#  index_meetings_on_club_id  (club_id)
#
# Foreign Keys
#
#  fk_rails_...  (club_id => clubs.id)
#
class Meeting < ApplicationRecord
  # extends ...................................................................
  # includes ..................................................................
  # relationships .............................................................
  belongs_to :club
  has_many :reads
  # validations ...............................................................
  validates :date, presence: true
  # callbacks .................................................................
  # scopes ....................................................................
  # additional config (i.e. accepts_nested_attribute_for etc...) ..............
  # class methods .............................................................
  # public instance methods ...................................................
  # protected instance methods ................................................
  # private instance methods ..................................................
end