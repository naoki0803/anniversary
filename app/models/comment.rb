class Comment < ApplicationRecord
  belongs_to :anniversary
  belongs_to :user
end