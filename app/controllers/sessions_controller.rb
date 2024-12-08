# frozen_string_literal: true

class SessionsController < ApplicationController
  def welcome
    render json: {
      welcome: 'your API has loaded'
    }
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user&.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      render json: @user
    else
      render json: {

        error: 'Your Username and Password do not match'
      }, status: :unauthorized

    end
  end

  def getuser
    if logged_in?
      render json: current_user
    else
      render json: {
        error: 'You are not logged in, please login in'
      }
    end
  end

  def destroy
    session.destroy
    render json: { notice: 'You are logged out' }
  end
end
