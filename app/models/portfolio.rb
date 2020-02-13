class Portfolio < ApplicationRecord
  validates :title,:image1, presence: true
  mount_uploader :image1, PfimageUploader
end
