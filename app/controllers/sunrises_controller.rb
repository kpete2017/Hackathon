class SunrisesController < ApplicationController
    require 'net/http'
    require 'open-uri'

    def index
        @default = Sunrise.first
        webrequest = "https://api.sunrise-sunset.org/json?"
        lat = "lat=#{@default.lat}&"
        lng = "lng=#{@default.lng}&"
        date = "date=#{@default.date}"
        full_string = webrequest + lat + lng + date
        url = full_string
        uri = URI.parse(url)
        response = Net::HTTP.get_response(uri)
        final_result = JSON.parse(response.body)
        render json: final_result
    end

    def create
        webrequest = "https://api.sunrise-sunset.org/json?"
        lat = "lat=#{params[:lat]}&"
        lng = "lng=#{params[:lng]}&"
        date = "date=#{params[:date]}"
        full_string = webrequest + lat + lng + date
        url = full_string
        uri = URI.parse(url)
        response = Net::HTTP.get_response(uri)
        final_result = JSON.parse(response.body)
        render json: final_result
        new_sunrise = Sunrise.new
        new_sunrise.lat = params[:lat]
        new_sunrise.lng = params[:lng]
        new_sunrise.date = params[:date]
        new_sunrise.sunrise_time = final_result["results"]["sunrise"]
        new_sunrise.save
    end

    def show
        @sunrise = Sunrise.find(params[:id])
        render json: @sunrise
    end

end
