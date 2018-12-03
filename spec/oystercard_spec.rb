require 'oystercard'

describe Oystercard do
  let(:oystercard) { Oystercard.new }

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

  context '#deduct' do

    it "deducts amount from your oystercard" do
      expect{ oystercard.deduct(5) }.to change{ oystercard.balance }.by(-5)
    end

  end

  context "#touch_in" do

    it "responds to oystercard touch in" do
      expect(oystercard).to respond_to(:touch_in)
    end

    it "changes the state of the oystercard - touch in" do
      oystercard.touch_in
      expect(oystercard.journey_status).to eq true
    end

  end

  context "#touch_out" do

    it "it changes the state of the oystercard - touch out" do
      oystercard.touch_out
      expect(oystercard.journey_status).to eq false
    end

  end

  context "#in_journey?" do

    it "returns true when in a journey" do
      oystercard.touch_in
      expect(oystercard.in_journey?).to eq true
    end

  end

end
