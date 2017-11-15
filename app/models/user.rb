class User < ApplicationRecord
    has_many :posts
    
    validates :username, :password, :email, presence: true
    validates :username, length: { in: 1...15 }, uniqueness: true
    validates :password, length: { in: 10...35 }
    validates :email, length: { in: 1...100 }, uniqueness: true #Solamente puede haber un email con este valor en toda la tabla
end
