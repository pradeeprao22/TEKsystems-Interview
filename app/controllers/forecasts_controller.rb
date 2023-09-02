class ForecastsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_forecast, only: [:show]
  
    def index
      @forecasts = Forecast.all
    end
  
    def create
      @address = params[:address]
      forecast = retrieve_forecast(@address)
  
      if forecast
        @forecast_data = forecast
        @cached = false
        @extended_forecast = fetch_extended_forecast(@address)
        create_forecast_extended(@forecast_data, @extended_forecast) if @extended_forecast.present?
      else
        @cached = true
      end
    end
  
    private
  
    def set_forecast
      @forecast_data = Forecast.find(params[:id])
    end
  
    def retrieve_forecast(address)
      Rails.cache.fetch("forecast_#{address}", expires_in: 30.minutes) do
        coordinates = Geocoder.coordinates(address)
        if coordinates
          latitude, longitude = coordinates
          response = fetch_weather_data(latitude, longitude)
          create_forecast(address, JSON.parse(response.body))
        else
          nil
        end
      end
    end
  
    def fetch_weather_data(latitude, longitude)
      HTTParty.get("https://api.openweathermap.org/data/2.5/weather?lat=#{latitude}&lon=#{longitude}&appid=#{OPENWEATHERMAP_API_KEY}")
    end
  
    def create_forecast(address, weather_data)
      Forecast.create(
        address: address,
        current_temperature: weather_data['main']['temp'],
        high_temperature: weather_data['main']['temp_max'],
        low_temperature: weather_data['main']['temp_min'],
        cached_at: Time.now
      )
    end
  
    def fetch_extended_forecast(address)
      coordinates = Geocoder.coordinates(address)
      if coordinates
        latitude, longitude = coordinates
        response = fetch_extended_weather_data(latitude, longitude)
        JSON.parse(response.body)
      else
        nil
      end
    end
  
    def fetch_extended_weather_data(latitude, longitude)
      HTTParty.get("https://api.openweathermap.org/data/2.5/forecast?lat=#{latitude}&lon=#{longitude}&appid=#{OPENWEATHERMAP_API_KEY}")
    end
  
    def create_forecast_extended(forecast, extended_forecast)
      forecast.update(extended_forecast: JSON.dump(extended_forecast))
    end
  end  