class NrelService
  def initialize(zip_code)
    @zip_code = zip_code
  end

  def closest_stations(limit)
    propane_data = propane_stations(limit)
    electric_data = electric_stations(limit)
    station_data = propane_data.zip(electric_data).flatten
  end

  def propane_stations(limit)
    propane_response = conn.get("/api/alt-fuel-stations/v1/nearest.json?location=#{@zip_code}&radius=10.0&fuel_type=LPG&limit=#{limit / 2}")
    JSON.parse(propane_response.body, symbolize_names: true)[:fuel_stations]
  end

  def electric_stations(limit)
    electric_response = conn.get("/api/alt-fuel-stations/v1/nearest.json?location=#{@zip_code}&radius=10.0&fuel_type=ELEC&limit=#{limit / 2}")
    JSON.parse(electric_response.body, symbolize_names: true)[:fuel_stations]
  end

  def conn
    Faraday.new(url: "https://developer.nrel.gov") do |faraday|
      faraday.params["api_key"] = ENV["nrel_key"]
      faraday.adapter Faraday.default_adapter
    end
  end
end
