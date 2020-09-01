# == Schema Information
#
# Table name: memberships
#
#  id         :bigint           not null, primary key
#  role       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  club_id    :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_memberships_on_club_id  (club_id)
#  index_memberships_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (club_id => clubs.id)
#  fk_rails_...  (user_id => users.id)
#
class Membership < ApplicationRecord
  ROLE_TYPES = %w[admin moderator member].freeze
  enum role: ROLE_TYPES

  belongs_to :user
  belongs_to :club

  validates :role, presence: true
end
