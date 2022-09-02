require 'rest-client'
KEY_VALUE = ENV["WEATHER_KEY"]

class WeatherController < ApplicationController

    def saved_user_current
        location = @user.home_location_code
        @response = RestClient.get"http://api.weatherapi.com/v1/current.json?key=#{KEY_VALUE}&q=#{location}&aqi=no"

        current_weather = JSON.parse(@response.body)

        render json: current_weather
    end

end