class AddressSerializer < ActiveModel::Serializer
  attributes :id ,:house_number,:street
  belongs_to :user
end
