require 'rails_helper'

RSpec.describe "Forecasts", type: :request do
  describe "GET /forecast" do
    it "returns http success" do
      get "/forecast"
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /forecast" do

    let(:response_body) do
      file_fixture("success_response.json").read
    end

    let(:location) { "Cupertino, CA" }

    let(:request_url) do
      ForecastService.url_for_location(location)
    end

    let(:params) do
      { query: location }
    end

    before do
      stub_request(:get, request_url).to_return(status: 200, body: response_body)
    end

    it "returns http success" do
      post "/forecast", params: params
      expect(response).to have_http_status(:success)
    end
  end

end
