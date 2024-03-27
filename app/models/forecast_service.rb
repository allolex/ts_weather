class InvalidQueryError < StandardError
  def initialize(msg = "Query not valid. We need more letters or digits to match on in the location.")
    super
  end
end

class QueryError < StandardError; end

class QueryPermissionError < StandardError; end

class ForecastService
  URL = "http://api.weatherapi.com/v1/forecast.json?key=#{Settings.weather_api_key}&days=1&aqi=no&alerts=no"

  def self.get(location)
    raise InvalidQueryError unless location =~ /\w{2,}|\d{5,}/

    response = Faraday.get(url_for_location(location))
    parsed_response = JSON.parse(response.body)

    if response.status == 403
      raise QueryPermissionError, "Permission denied. Is your API key valid?"
    end

    if response.status != 200
      raise QueryError, parsed_response&.dig("error", "message") || "Unknown query error"
    end

    {
      current: display_temps(
        current(parsed_response)["temp_c"],
        current(parsed_response)["temp_f"]
      ),
      high: display_temps(
        forecast(parsed_response)["maxtemp_c"],
        forecast(parsed_response)["maxtemp_f"]
      ),
      low: display_temps(
        forecast(parsed_response)["mintemp_c"],
        forecast(parsed_response)["mintemp_f"]
      ),
      latitude: location(parsed_response)["lat"],
      longitude: location(parsed_response)["lon"],
      location_name: location(parsed_response)["name"],
    }
  end

  def self.url_for_location(location)
    "#{URL}&q=#{location}"
  end

  def self.current(parsed_response)
    parsed_response["current"]
  end

  private_class_method :current

  def self.forecast(parsed_response)
    parsed_response.dig("forecast", "forecastday", 0, "day")
  end

  private_class_method :forecast

  def self.location(parsed_response)
    parsed_response["location"]
  end

  private_class_method :location

  def self.display_temps(celsius, fahrenheit)
    "#{celsius}º C / #{fahrenheit}º F"
  end

  private_class_method :display_temps

end