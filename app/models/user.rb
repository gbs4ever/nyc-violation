class User < ApplicationRecord
has_secure_password
has_many :plates 
has_many :addresses
validates :email , uniqueness: true
end
