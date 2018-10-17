require "rails_helper"

describe StationSearch do
  it 'exists' do
    stations = StationSearch.new(80203)

    expect(stations).to be_a(StationSearch)
  end

  context 'instance methods' do
    context '#closest_stations' do
      it 'should return 10 closest stations to given zip' do
        stations = StationSearch.new(80203)

        station = stations.closest.first

        expect(stations.closest.count).to eq(10)
      end
    end
  end
end
