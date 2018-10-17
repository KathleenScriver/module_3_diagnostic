require "rails_helper"

describe NrelService do
  it 'exists' do
    service = NrelService.new("80203")

    expect(service).to be_a(NrelService)
  end

  context 'instance methods' do
    context '#closest_stations' do
      it 'should return array of hashes with stations, 10 by default' do
        service = NrelService.new("80203")

        result = service.closest_stations.first

        expect(service.closest_stations.count).to eq(10)
        expect(result).to have_key(:station_name)
        expect(result).to have_key(:street_address)
        expect(result).to have_key(:fuel_type_code)
        expect(result).to have_key(:distance)
        expect(result).to have_key(:access_days_time)
      end
    end
  end
end
