class Article < ApplicationRecord
  belongs_to :cook
  mount_uploader :image
end
