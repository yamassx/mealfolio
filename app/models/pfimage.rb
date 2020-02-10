class Pfimage < ApplicationRecord
  mount_uploader :pfimage, PfimageUploader
  belongs_to :portfolio
end
