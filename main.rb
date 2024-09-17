# frozen_string_literal: true

require_relative 'weather_service'

# Создаем адаптеры
open_weather_adapter = OpenWeatherMapAdapter.new
weather_api_adapter = WeatherApiAdapter.new

# Создаем сервис погоды с разными адаптерами
service_open_weather = WeatherService.new(open_weather_adapter)
service_weather_api = WeatherService.new(weather_api_adapter)

# Координаты
latitude = 55.7558
longitude = 37.6173

# Получаем данные о погоде через разные адаптены
weather_open_weather = service_open_weather.get_weather(latitude, longitude)
weather_weather_api = service_weather_api.get_weather(latitude, longitude)


puts 'Weather from OpenWeatherMap:'
puts weather_open_weather

puts "\nWeather from WeatherApi:"
puts weather_weather_api
