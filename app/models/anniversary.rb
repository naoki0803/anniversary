class Anniversary < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  has_one_attached :image
  has_many :comments
  has_many :lists

  validates :category_id, numericality: { other_than: 1 } 
end
