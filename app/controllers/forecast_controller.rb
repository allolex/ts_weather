class ForecastController < ApplicationController
  def query

  end

  # Display the current forecast from the ForecastService and cache the result for 30 minutes.
  # Pass @fetched_from_cache to the view to make sure the user knows whether the cache is being used.
  def display
    @fetched_from_cache = true

    @forecast = Rails.cache.fetch(cache_key, expires_in: 30.minutes) do
      @fetched_from_cache = false
      ForecastService.get(forecast_params).to_hash
    end
  end

private

  # Use only lower case word characters, digits, or a comma to create cache key.
  # This allows caching on location names and postcodes/zip codes that have spaces etc in them.
  def cache_key
    "#{forecast_params.downcase.scan(/[\w\d,]/)}/forecast"
  end

  def forecast_params
    params.require(:query)
  end
end
