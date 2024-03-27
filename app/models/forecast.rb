Forecast = Data.define(
  :current_c,
  :current_f,
  :high_c,
  :high_f,
  :low_c,
  :low_f,
  :latitude,
  :longitude,
  :location_name
) do

  def to_hash
    ActiveSupport::HashWithIndifferentAccess.new(
      current: display_temps(self.current_c, self.current_f),
      high: display_temps(self.high_c, self.high_f),
      low: display_temps(self.low_c, self.low_f),
      latitude: self.latitude,
      longitude: self.longitude,
      location_name: self.location_name
    )
  end

  def display_temps(celsius, fahrenheit)
    "#{celsius}º C / #{fahrenheit}º F"
  end
end