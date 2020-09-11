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
FactoryBot.define do
  factory :meeting do
    date { "2020-09-11 11:42:55" }
    club
  end
end
