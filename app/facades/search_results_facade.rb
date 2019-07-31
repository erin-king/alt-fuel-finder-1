class SearchResultsFacade
  def initialize(criteria)
    @criteria = criteria
  end

  def results
    conn = Faraday.new('https://developer.nrel.gov/') do |f|
      f.params['api_key'] = ENV['NREL_API_KEY']
      f.adapter Faraday.default_adapter
    end
    response = conn.get("api/alt-fuel-stations/v1/nearest?format=json&location=#{@criteria}&fuel_type=ELEC,LPG&access=public&status=E")
    results = JSON.parse(response.body, symbolize_names:true)

    results.map do |result|
        FuelStation.new(result_data)
    end

  end

  def total_results
    "#{results.count} Results"
  end

end
