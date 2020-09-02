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
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_person_name

  # associations
  has_many :memberships
  has_many :clubs, through: :memberships
  has_many :books
  has_many :recommendations, through: :books

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true

  def is_club_member(club)
    return false unless memberships.exists?(club_id: club.id)
    
    true
  end

  def club_role(club)
    return 'non-member' unless is_club_member(club)

    memberships.where(club_id: club.id).first.role
  end
end
