class ViolationsController < ApplicationController
 
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
  req.params['$limit'] = 10 
    end
  
  if @resp.success?
    body = JSON.parse(@resp.body)
    if body.empty?
      
       render json:{
        notice: "Yay No tickets"
      } and return
 
      ##need to break 
    else
      user= current_user.plates.build(number: params[:violation][:number], state: params[:violation][:state])
      current_user.save
      render json: body
    end
  else
    render json:{
        error: "Api failed "
      }
  end
 

end







end