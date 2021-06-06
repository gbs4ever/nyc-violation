# frozen_string_literal: true

class Plate < ApplicationRecord
  belongs_to :user
  validates :number, uniqueness: { scope: :user } , presence: true
 validates :state , presence: true
end
