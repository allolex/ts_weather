require_relative '../rails_helper'

# plain old ruby object - poro
RSpec.describe ForecastService, type: :poro do
  describe '.get' do
    subject { described_class.get(location) }

    let(:request_url) do
      described_class.url_for_location(location)
    end

    let(:location) { '1 Infinite Loop, Cupertino, CA' }

    context 'with a valid API key' do
      context 'with a valid location' do
        let(:response_body) do
          file_fixture("success_response.json").read
        end

        before do
          stub_request(:get, request_url).to_return(status: 200, body: response_body)
        end

        it 'returns a Forecast instance' do
          expect(subject).to be_a(Forecast)
        end

        it 'returns a forecase for the correct location' do
          expect(subject.location_name).to eq "Cupertino"
        end
      end

      context 'with an invalid location' do
        let(:location) { 'X' }

        it "raises an InvalidQueryError" do
          expect { subject }.to raise_error(InvalidQueryError, /Query not valid.*location/)
        end
      end

      context 'with an invalid API key' do
        before do
          stub_request(:get, request_url).to_return(status: 403, body: "{}")
        end

        it 'raises a QueryError with a useful message' do
          expect { subject }.to raise_error(QueryPermissionError, /Is your API key valid/)
        end
      end
    end
  end

  describe '.url_for_location' do
    let(:location) { '1 Infinite Loop, Cupertino, CA' }

    let(:request_url) { described_class.url_for_location(location) }

    context 'with a valid location' do
      it 'returns a valid URL' do
        expect { URI.parse(request_url) rescue nil }.to_not raise_error
      end

      it 'returns a URL with the current API key' do
        expect(request_url).to match(/testkey/)
      end
    end
  end
end