class WeatherService
  def initialize(adapter)
    @adapter = adapter
  end

  def get_weather(latitude, longitude)
    @adapter.get_weather_data(latitude, longitude)
  end
end

class WeatherAdapter
  def get_weather_data(latitude, longitude)
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end

class OpenWeatherMapAdapter < WeatherAdapter
  def get_weather_data(_latitude, _longitude)
    # Заглушка для OpenWeatherMap
    WeatherData.new(temperature: 25.5, humidity: 60.0, wind_speed: 5.2)
  end
end

class WeatherApiAdapter < WeatherAdapter
  def get_weather_data(_latitude, _longitude)
    # Заглушка для WeatherApi
    WeatherData.new(temperature: 26.0, humidity: 58.0, wind_speed: 4.8)
  end
end

class WeatherData
  attr_reader :temperature, :humidity, :wind_speed

  def initialize(temperature:, humidity:, wind_speed:)
    @temperature = temperature
    @humidity = humidity
    @wind_speed = wind_speed
  end

  def to_s
    "Temperature: #{@temperature}°C, Humidity: #{@humidity}%, Wind Speed: #{@wind_speed} m/s"
  end
end
