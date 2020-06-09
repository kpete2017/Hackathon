class SunrisesController < ApplicationController


    def index
        results = Geocoder.search("Paris")
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
        render json: results.first.coordinates
    end

    def create
        webrequest = "https://api.sunrise-sunset.org/json?"
        search_query = Geocoder.search(params[:location])
        coordinates = search_query.first.coordinates
        lat = "lat=#{coordinates[0]}&"
        lng = "lng=#{coordinates[1]}&"
        date = "date=#{params[:date]}"
        full_string = webrequest + lat + lng + date
        uri = URI.parse(full_string)
        response = Net::HTTP.get_response(uri)
        final_result = JSON.parse(response.body)
        render json: final_result
        new_sunrise = Sunrise.new
        new_sunrise.lat = coordinates[0]
        new_sunrise.lng = coordinates[1]
        new_sunrise.date = params[:date]
        new_sunrise.sunrise_time = final_result["results"]["sunrise"]
        new_sunrise.save
    end

    def show
        @sunrise = Sunrise.find(params[:id])
        render json: @sunrise
    end

end
