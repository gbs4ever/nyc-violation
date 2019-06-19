class PlatesController < ApplicationController
  # can see all plates for this user  
def index
  #@plates = Plate.all
  
  @plates = current_user.plates
  render json: @plates
end
end
 