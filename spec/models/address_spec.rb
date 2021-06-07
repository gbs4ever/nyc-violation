# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Address, type: :model do
  before :each do
    @user = User.create(email: 'simcha@test.com', password: 'railsisthebest')
  end
  describe 'validations' do
    it 'requires a address to belong to a user ' do
      no_user = Address.create(street: '43rd', house_number: '1272')
      expect(no_user).not_to be_valid
      expect(no_user.errors.full_messages).to include(
        'User must exist'
      )
    end
  end
end
