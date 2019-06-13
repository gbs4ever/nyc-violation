class ViolationsController < ApplicationController
 
 ##1 will return array of 3 json objects
 ## 2 we want to send that data to redux
 ## 3 save params to plate model 
## user should be able to search and save there plate 
##  

def index
 params[:palate]
current_user.plates.build(parmas)

 @resp=get 'https://data.cityofnewyork.us/resource/uvbq-3m68.json'
# make sure it renders in json 
 render json: @resp
end







end