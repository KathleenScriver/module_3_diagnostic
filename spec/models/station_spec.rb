require "rails_helper"

describe Station do
  it 'exists' do
    station = Station.new(80203)

    expect(station).to be_a(Station)
  end
end
