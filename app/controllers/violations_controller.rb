# frozen_string_literal: true

class ViolationsController < ApplicationController
  before_action :confirm_logged_in?

  def search
    state = params[:violation][:state].upcase
    plate_num = params[:violation][:number].upcase
    @resp = Faraday.get('https://data.cityofnewyork.us/resource/nc67-uf89.json') do |req|
      req.params['plate'] = plate_num
      req.params['state'] = state
      req.params['$limit'] = 15
    end
    current_user.plates.build(number: params[:violation][:number], state: state)
    current_user.save
    if @resp.success?
      body = JSON.parse(@resp.body)
      if body.empty?
        render json: {
          notice: 'Yay No tickets'
        } and return
      end

      render json: body
    else
      render json: {
        error: 'Api failed '
      }
    end
  end

  def buildings
    street = params[:violation][:street].upcase
    house_number = params[:violation][:houseNumber]
    @resp = Faraday.get('https://data.cityofnewyork.us/resource/dvnq-fhaa.json?') do |req|
      req.params['house_number'] = house_number
      req.params['street'] = street
      req.params['$limit'] = 20
    end
    user = current_user
    user.addresses.build(house_number: house_number, street: street)
    user.save
    if @resp.success?
      body = JSON.parse(@resp.body)
      if body.empty?
        render json: {
          notice: 'No results please try searching again'
        } and return
      end

      render json: body

    else
      render json: {
        error: 'Api failed '
      }
    end
  end

  private

  def confirm_logged_in?
    return false if current_user

    render json: {
      error: 'Please login in to search'
    }
  end

  # Only allow a trusted parameter allowlist through, if saving to database
  #  def violation_params
  #    params.require(:violation).permit(:number, :state)
  #  end
end
