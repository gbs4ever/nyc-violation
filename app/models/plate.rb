# frozen_string_literal: true

# == Schema Information
#
# Table name: plates
#
#  id         :bigint           not null, primary key
#  number     :string
#  state      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
class Plate < ApplicationRecord
  belongs_to :user
  validates :number, uniqueness: { scope: :user }, presence: true
  validates :state, presence: true
end
