require 'rest-client'
KEY_VALUE = ENV["WEATHER_KEY"]

class WeatherController < ApplicationController
    skip_before_action :authorized, only: [:search_result_weather, :geolocation]

    def saved_user_current
        location = @user.home_location_code
        @response = RestClient.get"http://api.weatherapi.com/v1/forecast.json?key=#{KEY_VALUE}&q=#{location}&days=5&aqi=no"

        current_weather = JSON.parse(@response.body)

        render json: current_weather
    end

    def search_result_weather
        search_location = params[:location]
        @response = RestClient.get"http://api.weatherapi.com/v1/forecast.json?key=#{KEY_VALUE}&q=#{search_location}&days=5&aqi=no"

        result_weather = JSON.parse(@response.body)

        render json: result_weather
    end

    def geolocation
        search_location = params[:location]
        @response = RestClient.get"http://api.weatherapi.com/v1/forecast.json?key=#{KEY_VALUE}&q=#{search_location}&days=5&aqi=no"

        result_weather = JSON.parse(@response.body)

        render json: result_weather
    end

    private

    def geolocation_params
        params.permit(:latitude, :longitude)
    end

end