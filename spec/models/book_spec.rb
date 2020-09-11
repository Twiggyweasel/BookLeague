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
require 'rails_helper'

RSpec.describe Book, type: :model do
  subject(:book) { create(:book) }

  describe "associations" do
    it { should belong_to(:user) } 
    it { should have_many(:recommendations) } 
    it { should have_many(:reads) }
    it { should define_enum_for(:genre).with_values(%w[Fantasy Horror Mystery SciFi Thriller]) }
  end
  
  describe "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:author) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:genre) }
    it { should validate_length_of(:title).is_at_least(6).is_at_most(75) }
  end
  
end
