class PlateSerializer < ActiveModel::Serializer
  attributes :id , :number, :state
   belongs_to :user
  
end
