class Picture < ApplicationRecord
  belongs_to :post
  belongs_to :game
  
  validates :description, :image, presence: true
end
