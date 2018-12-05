require 'oystercard'

describe Oystercard do
  let(:oystercard) { Oystercard.new }
  let(:station) { double :station }
  let(:station_out) { double :station_out }

  context '#balance' do

    it 'card has money' do
      expect(oystercard.balance).to eq 0
    end

  end

  context '#top_up' do

    it 'responds to top_up' do
      expect(oystercard).to respond_to(:top_up).with(1).argument
    end

    it 'tops up your oystercard' do
      expect{ oystercard.top_up(5) }.to change{ oystercard.balance }.by(5)
    end

    it 'Blocks top up if over the limit' do
      expect{ oystercard.top_up(Oystercard::MAX_BALANCE + 1) }.to raise_error "Max balance allowed is £#{Oystercard::MAX_BALANCE}"
    end

  end

  context "#touch_in" do

    it "responds to oystercard touch in" do
      expect(oystercard).to respond_to(:touch_in)
    end

    it "raises an error if balance is less than Minimum fare" do
      expect{ oystercard.touch_in(station) }.to raise_error "Balance is too low"
    end

  end

  context "#touch_out" do

    it "#deducts correct amount when journey is complete and touching out" do
      # Challenge 10 - above test replaced with below afetr moving #deduct into private
      expect{ oystercard.touch_out(station_out) }.to change{ oystercard.balance }.by(-Oystercard::MINIMUM_FARE)
    end

  end

end
