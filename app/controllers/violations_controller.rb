class ViolationsController < ApplicationController
 before_action :confirm_logged_in?

  def search

  state=params[:violation][:state].upcase
  @resp = Faraday.get('https://data.cityofnewyork.us/resource/uvbq-3m68.json') do |req|
    req.params['plate'] = params[:violation][:number]
    req.params['state'] = state
    req.params['$limit'] = 15 
  end
   user = current_user
   user.plates.build(number: params[:violation][:number], state: state)
     user.save

  if @resp.success?
    
    body = JSON.parse(@resp.body)
    if body.empty?
      
       render json:{
        notice: "Yay No tickets"
      } and return
 
      ##need to break 
    else
     
     
      render json: body
    end
  else
    render json:{
        error: "Api failed "
      }
  end
end
  def buildings
  street=params[:violation][:street].upcase
    @resp = Faraday.get('https://data.cityofnewyork.us/resource/dvnq-fhaa.json?') do |req|
      req.params['house_number']  = params[:violation][:houseNumber]
      req.params['street'] = street
      req.params['$limit'] = 20
    end
      
      if @resp.success?
        body = JSON.parse(@resp.body)
          if body.empty?  
            render json:{
              notice: "No results please try searching again"
            } and return
          else
            render json: body
          end
        else
       render json:{
          error: "Api failed "
        }
      end

    end 


















private
    def confirm_logged_in?
      if  !current_user
      render json:{
              error: "Please login in to search"
            }
      end  
    end



# Only allow a trusted parameter "white list" through, if saving to database 
  #  def violation_params
  #    params.require(:violation).permit(:number, :state)
  #  end


end