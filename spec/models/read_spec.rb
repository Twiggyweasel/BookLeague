# == Schema Information
#
# Table name: reads
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  book_id    :bigint           not null
#  meeting_id :bigint           not null
#
# Indexes
#
#  index_reads_on_book_id     (book_id)
#  index_reads_on_meeting_id  (meeting_id)
#
# Foreign Keys
#
#  fk_rails_...  (book_id => books.id)
#  fk_rails_...  (meeting_id => meetings.id)
#
require 'rails_helper'

RSpec.describe Read, type: :model do
  subject(:read) { create(:read) }

  describe "associations" do
    it { should belong_to(:book) } 
    it { should belong_to(:meeting) } 
  end
  
end
