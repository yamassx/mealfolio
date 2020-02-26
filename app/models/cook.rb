class Cook < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :first_name, :last_name, :nickname, presence: true
  has_many :portfolios
  mount_uploader :face, CookimageUploader
  mount_uploader :background, CookimageUploader
  attr_accessor :current_password
  
end
