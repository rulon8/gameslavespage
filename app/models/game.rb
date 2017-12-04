class Game < ApplicationRecord
    has_many :pictures
    
    validates :name, presence:true, uniqueness: true
end
