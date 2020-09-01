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
require "rails_helper"

RSpec.describe Membership, type: :model do
  subject(:membership) { create(:membership) }

  describe "associations" do
    it { should belong_to(:user) }
    it { should belong_to(:club) }
    it { should define_enum_for(:role).with_values(%w[admin moderator member]) }
  end
  describe "validations" do
    it { should validate_presence_of(:role) }
  end
end
