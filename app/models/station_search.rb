class StationSearch
  def initialize(zip_code)
    @zip_code = zip_code
  end

  def closest_stations(limit = 10)
    conn = Faraday.new(url: "https://developer.nrel.gov") do |faraday|
      faraday.params["api_key"] = ENV["nrel_key"]
      faraday.adapter Faraday.default_adapter
    end

    response = conn.get("/api/alt-fuel-stations/v1/nearest.json?location=#{@zip_code}&radius=10.0&fuel_type=ELEC&fuel_type=LPG&limit=#{limit}")

    station_data = JSON.parse(response.body, symbolize_names: true)[:fuel_stations]

    station_data.map do |raw_station|
      Station.new(raw_station)
    end

  end
end
