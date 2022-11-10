class Like < ApplicationRecord
  belongs_to :user
  belongs_to :anniversary

  validates_uniqueness_of :anniversary_id, scope: :user_id
end