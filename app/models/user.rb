class User < ApplicationRecord
has_secure_password
has_many :plates 
has_many :address
validates :email , uniqueness: true
end
