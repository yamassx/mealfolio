class Portfolio < ApplicationRecord
  validates :title, presence: true
  mount_uploader :image1,  PfimageUploader
end
