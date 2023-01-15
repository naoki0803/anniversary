class Anniversary < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  has_one_attached :image
  has_many :comments
  has_many :lists
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user

  validates :image,                 presence: true
  validates :anniversary_name,      presence: true
  validates :anniversary_date,      presence: true
  validates :category_id,           numericality: { other_than: 1 , message: "を選択してください"}


  def self.search(search)
    if search != ""
      Anniversary.where(['anniversary_description LIKE(?) OR anniversary_name LIKE(?)', "%#{search}%", "%#{search}%"])
    else
      Anniversary.all
    end
  end

end