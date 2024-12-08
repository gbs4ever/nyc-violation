# frozen_string_literal: true

require 'rails_helper'
require 'json'
RSpec.describe 'Sessions', type: :request do
  describe 'GET /index' do
    pending 'add some examples (or delete)'
  end

  describe 'POST /sessions' do
    describe 'on success' do
      before(:each) do
        password = 'testtest'
        email = 'test@email.com'
        @user = User.create(email: email, password: password)

        params = {
          email: email,
          password: password
        }
        post '/sessions',
             params: params.to_json,
             headers: { 'Content-Type': 'application/json' }
        @response = response
      end

      it "returns the user's data " do
        body = JSON.parse(@response.body)
        expect(@response.status).to eq(200)
        expect(body['email']).to include @user.email
        expect(body).to include 'plates'
        expect(body).to include 'addresses'
        expect(body).not_to be_empty
      end
    end

    describe 'on failure' do
      it 'returns a 401 status with a helpful error message' do
        params = {
          username: 'fakeuser',
          password: 'fakepassword'
        }
        post '/sessions',
             params: params.to_json,
             headers: { 'Content-Type': 'application/json' }
        body = response.parsed_body
        expect(@response.status).to eq(401)
        expect(body['error']).to include 'Your Username and Password do not match'
      end
    end
  end
end
