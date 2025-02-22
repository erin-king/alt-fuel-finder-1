class FuelStation

  attr_reader :name,
              :address,
              :fuel_type,
              :distance,
              :access_times
              
  def initialize(data)
    @name = data[:station_name]
    @address = data[:street_address]
    @fuel_type = data[:fuel_type_code]
    @distance = data[:distance]
    @access_times = data[:access_days_time]
  end
end
