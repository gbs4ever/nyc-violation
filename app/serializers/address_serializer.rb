# frozen_string_literal: true

# == Schema Information
#
# Table name: addresses
#
#  id           :bigint           not null, primary key
#  house_number :text
#  street       :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :integer
#
class AddressSerializer < ActiveModel::Serializer
  attributes :id, :house_number, :street
  belongs_to :user
end
