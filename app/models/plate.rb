# frozen_string_literal: true

class Plate < ApplicationRecord
  belongs_to :user
  validates :number, uniqueness: { scope: :user }
end
