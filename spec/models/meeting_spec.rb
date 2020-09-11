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
require 'rails_helper'

RSpec.describe Meeting, type: :model do
  subject(:meeting) { create(:meeting) }
  describe "associations" do
    it { should belong_to(:club) }
    it { should have_many(:reads) } 
  end

  describe "validations" do
    it { should validate_presence_of(:date) }
  end
end
