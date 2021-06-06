require 'rails_helper'

RSpec.describe User, type: :model do

    before :each do
      
        @password = "samplepassword"
        @email = "sample@email.com"
    end

    describe 'on save' do
        it 'hashes a password' do
            user = User.create(email: @email, password: @password)
            user.save

            expect(user.password_digest).not_to eq(user.password)
        end
    end

    describe 'validations' do
        it 'requires a email and a password upon creation' do
           
            no_password = User.create(email: @email)
            no_email = User.create( password: @password)

           
            expect(no_password).not_to be_valid
            expect(no_password.errors.full_messages).to include(
                "Password can't be blank"
                
            )

            expect(no_email).not_to be_valid
            expect(no_email.errors.full_messages).to include("Email can't be blank")
        end

        it 'requires that the username be unique' do
            User.create(email: @email, password: @password)
            duplicate_user = User.create(email: @email, password: @password)

            expect(duplicate_user).not_to be_valid
            expect(duplicate_user.errors.full_messages).to include("Email has already been taken")
        end

        
    end
end