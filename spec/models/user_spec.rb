# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  first_name             :string           not null
#  last_name              :string           not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
require "rails_helper"

RSpec.describe User, type: :model do
  subject(:user) { create(:user) }
  describe "associations" do
    it { should have_many(:memberships) }
    it { should have_many(:clubs).through(:memberships) }
    it { should have_many(:books) } 
    it { should have_many(:recommendations).through(:books) }
  end

  describe "validations" do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:email) }
  end

  describe "#club_member?" do
    it "should return true if user is member of requested club" do
      club = create(:club)
      Membership.create(role: 0, club_id: club.id, user_id: subject.id)
      expect(subject.club_member?(club)).to be true 
    end
    it "should return false if the user is not member of requested club" do
      club = create(:club)
      expect(subject.club_member?(club)).to be false       
    end
  end

  describe "#club_role" do
    it "should return role if user is member of requested club" do
      club = create(:club)
      membership = Membership.create(role: 0, club_id: club.id, user_id: subject.id)
      expect(subject.club_role(club)).to eq membership.role
    end
    it "should return 'non-member' if user is not member of requested club" do
      club = create(:club)
      expect(subject.club_role(club)).to eq "non-member"
    end
  end
  
end
