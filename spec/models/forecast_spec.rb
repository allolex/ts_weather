require_relative '../rails_helper'

# plain old ruby object - poro
RSpec.describe Forecast, type: :poro do
  let(:example_attributes) do
    {
      current_c: 16.0,
      current_f: 60.8,
      high_c: 18.6,
      high_f: 65.5,
      low_c: 7.7,
      low_f: 45.9,
      latitude: 37.32,
      longitude: -122.03,
      location_name: "Cupertino"
    }
  end

  describe 'initialization' do
    context 'with the required parameters' do
      it 'it succeeds' do
        expect(described_class.new(**example_attributes)).to be_a Forecast
      end
    end

    context 'with missing parameters' do
      let(:missing_location_name_attributes) do
        {
          current_c: 16.0,
          current_f: 60.8,
          high_c: 18.6,
          high_f: 65.5,
          low_c: 7.7,
          low_f: 45.9,
          latitude: 37.32,
          longitude: -122.03
        }
      end

      it 'it fails' do
        expect {
          described_class.new(**missing_location_name_attributes)
        }.to raise_error(ArgumentError, /missing keyword: :location_name/)
      end
    end
  end

  describe '#to_hash' do
    subject { described_class.new(**example_attributes).to_hash }

    it "has the expected return value" do
      expect(subject).to eq({
                              current: "16.0º C / 60.8º F",
                              high: "18.6º C / 65.5º F",
                              low: "7.7º C / 45.9º F",
                              latitude: 37.32,
                              longitude: -122.03,
                              location_name: "Cupertino"
                            })
    end
  end
end
