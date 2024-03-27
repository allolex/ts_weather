class ForecastController < ApplicationController
  def query

  end

  def display
    @forecast = ForecastService.get(forecast_params).to_hash
  end

private

  def forecast_params
    params.require(:query)
  end
end
