class Plate < ApplicationRecord
  belongs_to :user
  validates :number , uniqueness: {scope: :user} 
end
