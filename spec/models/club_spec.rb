# == Schema Information
#
# Table name: clubs
#
#  id          :bigint           not null, primary key
#  description :text
#  founded     :date
#  invite_code :string
#  is_private  :boolean          default(FALSE)
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require "rails_helper"

RSpec.describe Club, type: :model do
  subject(:club) { create :club }
  describe "Associations" do
    it { should have_many(:memberships) } 
    it { should have_many(:users).through(:memberships) } 
    it { should have_many(:recommendations) } 
  end
  
  describe "Validations" do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name).case_insensitive }
    it { should validate_presence_of(:founded) }
    it "is expected to have a founded date in the past" do
      subject.founded = Time.now + 2.days
      expect(subject).to be_invalid
    end
  end
end
