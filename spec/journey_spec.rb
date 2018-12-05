require 'journey'
require 'oystercard'

describe Journey do

  #let(:journey) { Journey.new }
  let(:oystercard) { double :oystercard, balance: 10 }
  let(:station) { double :station }
  let(:station_out) { double :station_out }

context "#touch_in" do

  it "records entry station on touch in" do
    journey = Journey.new(oystercard)
    p journey
    p ">>>>>>>>>>>>>>>>>>>>>>>"
    p oystercard
    #allow(oystercard).to receive(:top_up).and_return(10)
    journey.touch_in(station)
    expect(journey.entry_station).to eq station
  end

end

  xit "resets entry station variable on touch out" do
    # oystercard.top_up(Oystercard::MINIMUM_FARE)
    oystercard.touch_out(station_out)
    expect(oystercard.entry_station).to eq([])
  end

  xit "adds journey history on touch out" do
    # oystercard.top_up(Oystercard::MIN_BALANCE)
    oystercard.touch_in(station)
    oystercard.touch_out(station_out)
    expect(oystercard.journey_history).to eq({ station => station_out })
  end

end
