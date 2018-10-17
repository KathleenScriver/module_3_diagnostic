require "rails_helper"

describe Station do
  it 'exists' do
    station_params = {
                      name: "Station 1",
                      street_address: "2000 W Lower Colfax Ave",
                      fuel_type: "LPG",
                      distance: 1.8806,
                      access_days_times: "7am-7pm M-Th and Sat, 7am-8pm F, 9am-5pm Sun"
    }

    station = Station.new(station_params)

    expect(station).to be_a(Station)
  end
end
