class Post < ApplicationRecord
  belongs_to :user
  
  validates_associated :user #No hay posts sin usuario
  validates :title, :date, :user_id, presence: true #verifica existencia de usuario, fecha y titulo
  
end
