class User < ApplicationRecord
has_secure_password
has_many :plates

validates :email , uniqueness: true
end
