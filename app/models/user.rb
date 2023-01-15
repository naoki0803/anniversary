class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX }
  validates :nickname,         presence: true


  has_many :anniversaries
  has_many :comments
  has_many :likes, dependent: :destroy
  has_many :liked_anniversaries, through: :likes, source: :anniversary

  def liked_by?(anniversary_id)
    likes.where(anniversary_id: anniversary_id).exists?
  end

end
