require 'rails_helper'

describe FuelStation, type: :model do
  before :each do
    @attributes = {
      station_name: 'PUBLIC STATIONS',
      street_address: '2951-2985 E 3rd Ave',
      fuel_type_code: 'ELEC',
      distance: '3.5',
      access_days_time: '24 hours daily'
    }

    @fuel_station = FuelStation.new(@attributes)
  end

  it 'should exist' do
    expect(@fuel_station).to be_a(FuelStation)
  end

  it 'has attributes' do
    expect(@fuel_station.name).to eq(@attributes[:station_name])
    expect(@fuel_station.address).to eq(@attributes[:street_address])
    expect(@fuel_station.fuel_type).to eq(@attributes[:fuel_type_code])
    expect(@fuel_station.distance).to eq(@attributes[:distance])
    expect(@fuel_station.access_times).to eq(@attributes[:access_days_time])
  end

end
