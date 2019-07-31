require 'rails_helper'

describe 'NrelService' do
  describe 'station_results' do
    it 'finds relevant all stations' do
      VCR.use_cassette("services/station_results") do
        service = NrelService.new
        results = service.get_stations(80206)

        expect(results[:total_results]).to eq(93)
        expect(results[:fuel_stations][0][:station_name]).to eq("PUBLIC STATIONS")
        expect(results[:fuel_stations][0][:street_address]).to eq("2951-2985 E 3rd Ave")
        expect(results[:fuel_stations][0][:fuel_type_code]).to eq("ELEC")
        expect(results[:fuel_stations][0][:distance]).to eq(0.62888)
        expect(results[:fuel_stations][0][:access_days_time]).to eq("24 hours daily")
      end
    end
  end
end
