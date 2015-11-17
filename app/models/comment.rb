# == Schema Information
#
# Table name: comments
#
#  id               :integer          not null, primary key
#  commentable_id   :integer
#  body             :text             not null
#  commentable_type :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Comment < ActiveRecord::Base
  validates :body, presence: true

  belongs_to :commentable,
    polymorphic: true
end
