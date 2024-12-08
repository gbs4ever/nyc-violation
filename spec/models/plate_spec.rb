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
require 'rails_helper'

RSpec.describe Plate, type: :model do
  before :each do
    @user = User.create(email: 'simcha@test.com', password: 'railsisthebest')
    @state = 'ny'
    @plate = 'hrferd13'
  end
  describe 'validations' do
    it 'requires a plate to belong to a user ' do
      no_user = Plate.create(state: @state, number: @plate)
      expect(no_user).not_to be_valid
      expect(no_user.errors.full_messages).to include(
        'User must exist'
      )
    end
    it 'requires a plate and a state upon creation' do
      no_plate =  @user.plates.create(state: @state)
      no_state =  @user.plates.create(number: @plate)

      expect(no_plate).not_to be_valid
      expect(no_plate.errors.full_messages).to include(
        "Number can't be blank"
      )
      expect(no_state).not_to be_valid
      expect(no_state.errors.full_messages).to include("State can't be blank")
    end
  end
end
