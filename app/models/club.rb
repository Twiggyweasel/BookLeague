# == Schema Information
#
# Table name: clubs
#
#  id          :bigint           not null, primary key
#  description :text
#  founded     :date
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Club < ApplicationRecord
  # Validations
  validates :name, presence: true, uniqueness: {case_sensitive: false}, length: {maximum: 50}
  validates :founded, presence: true
  validate :not_founded_in_the_future

  def not_founded_in_the_future
    return if founded.nil?

    errors.add(:end_founded, "cannot be in the future") unless founded <= Time.now
  end
end
