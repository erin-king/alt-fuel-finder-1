class NrelService

  def get_stations(criteria)
    get_json("api/alt-fuel-stations/v1/nearest?format=json&location=#{criteria}&fuel_type=ELEC,LPG&access=public&status=E&limit=15")
  end

  private

  def conn
    Faraday.new('https://developer.nrel.gov/') do |f|
      f.params['api_key'] = ENV['NREL_API_KEY']
      f.adapter Faraday.default_adapter
    end
  end

  def get_json(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names:true)
  end

end
