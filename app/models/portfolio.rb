class Portfolio < ApplicationRecord
  validates :title, presence: true
  has_one :pfimage
end
