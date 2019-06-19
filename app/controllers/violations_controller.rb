class ViolationsController < ApplicationController
 before_action :confirm_logged_in?
 ##1 will return array of 3 json objects- done
 ## 2 we want to send that data to redux 
 ## 3 save params to plate model  - saves
## user should be able to search and save there plate we need to add fetch request and send back there   
##  

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
 def buildings
  @resp = Faraday.get(' https://data.cityofnewyork.us/resource/dvnq-fhaa.json?') do |req|

  req.params['house_number'] = params[:violation][:number]
  req.params['street'] = state
  req.params['$limit'] = 20
    end
    if @resp.success?
    body = JSON.parse(@resp.body)
    if body.empty?  
       render json:{
        notice: "Yay No Violations"
      } and return
    else
      render json: body
    end
    else
    render json:{
        error: "Api failed "
      }
    end
binding.pry
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





end