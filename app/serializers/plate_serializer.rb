# frozen_string_literal: true

class PlateSerializer < ActiveModel::Serializer
  attributes :id, :number, :state
  belongs_to :user
end
