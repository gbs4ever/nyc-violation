class UserSerializer < ActiveModel::Serializer
  attributes :id, :email
  has_many :plates 
  has_many :addresses
end
