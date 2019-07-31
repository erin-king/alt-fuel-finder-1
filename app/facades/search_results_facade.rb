class SearchResultsFacade
  def initialize(criteria)
    @criteria = criteria
  end

  def station_results
    service_results[:fuel_stations].map do |result_data|
      FuelStation.new(result_data)
    end
  end

  def total_results
    "#{service_results[:total_results]} Results"
  end

  private

  def service
    @_service ||= NrelService.new
  end

  def service_results
    @service_results ||= service.get_stations(@criteria)
  end

end
