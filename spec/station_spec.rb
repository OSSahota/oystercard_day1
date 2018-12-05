require 'station'

describe 'station' do
  let(:name) { double :name }
  let(:zone) { double :zone }
  let(:station) { Station.new(name, zone) }

  describe '#initialise' do

    it 'initialises with a station name' do
      expect(station.name).to eq(name)
    end

    it 'initialises with a station zone' do
      expect(station.zone).to eq(zone)
    end
  end
end
