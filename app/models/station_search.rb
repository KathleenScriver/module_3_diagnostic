class StationSearch
  def initialize(zip_code)
    @zip_code = zip_code
  end

  def closest
    #get api data

    data.map do |raw_station|
      Station.new(raw_station)
    end

  end
end
