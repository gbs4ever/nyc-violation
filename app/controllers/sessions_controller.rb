class SessionsController < ApplicationController
    def create
      @user = User.find_by(email: params[:session][:email])
    if@user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      render json: @user
    else 
      render json:{
        error: "INVALID CREDEN"
      }
    
    end
  end
  def getuser
 # binding.pry
    if  logged_in?
    render json: current_user
    else 
      render json:{
        error: "You are not logged in, please login in"
      }
      
    end

    def destroy
    
      session.destroy
      render json:{ notice: "You are logged out"}
    end
  end  




end














