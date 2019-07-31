require 'rails_helper'

describe 'NrelService' do
  describe 'instance methods' do
    it '#get_stations' do
      service = NrelService.new
      results = service.get_stations(80206)

      expect(results).to have_key(:total_results)
      expect(results).to have_key(:fuel_stations)
    end
  end
end
