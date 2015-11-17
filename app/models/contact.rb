# == Schema Information
#
# Table name: contacts
#
#  id                :integer          not null, primary key
#  name              :string           not null
#  email             :string           not null
#  user_id           :integer          not null
#  created_at        :datetime
#  updated_at        :datetime
#  favorite_contacts :boolean          default("f")
#

class Contact < ActiveRecord::Base
  attr_accessor :favorite_contacts
  validates :name, :user_id, presence: true
  validates :email, presence: true, uniqueness: { scope: :user_id }

  belongs_to :owner,
    foreign_key: :user_id,
    primary_key: :id,
    class_name: "User"

  has_many :shares,
    foreign_key: :contact_id,
    primary_key: :id,
    class_name: "ContactShare"

  has_many :shared_users,
    through: :shares,
    source: :user

  has_many :comments,
    as: :commentable


end
