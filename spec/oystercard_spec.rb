require 'oystercard'

describe Oystercard do
  let(:oystercard) { Oystercard.new }
  let(:station) { double :station }

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

  # Challenge 10 - #deduct moved into private as it's being tested implicitly whilst testing #touch_out
  # context '#deduct' do
  #
  #   it "deducts amount from your oystercard" do
  #     expect{ oystercard.deduct(5) }.to change{ oystercard.balance }.by(-5)
  #   end
  #
  # end

  context "#touch_in" do

    it "responds to oystercard touch in" do
      expect(oystercard).to respond_to(:touch_in)
    end

    # Challenge 11 - commented out
    # it "changes the state of the oystercard - touch in" do
    #   oystercard.top_up(Oystercard::MINIMUM_FARE)
    #   oystercard.touch_in(station)
    #   expect(oystercard.journey_status).to eq true
    # end

    it "raises an error if balance is less than Minimum fare" do
      expect{ oystercard.touch_in(station) }.to raise_error "Balance is too low"
    end

    #Challenge 11
    it "records entry station on touch in" do
      oystercard.top_up(Oystercard::MINIMUM_FARE)
      oystercard.touch_in(station)
      expect(oystercard.entry_station).to eq station
    end

  end

  context "#touch_out" do

    # Challenge 11 - commented out
    # it "changes the state of the oystercard - touch out" do
    #   oystercard.touch_out
    #   expect(oystercard.journey_status).to eq false
    # end

    it "#deducts correct amount when journey is complete and touching out" do
      # Challenge 10 - following test obsolete once #deduct moved into private. Works in #deduct remains public
      # expect{ oystercard.deduct(Oystercard::MINIMUM_FARE) }.to change{ oystercard.balance }.by(-Oystercard::MINIMUM_FARE)

      # Challenge 10 - above test replaced with below afetr moving #deduct into private
      expect{ oystercard.touch_out }.to change{ oystercard.balance }.by(-Oystercard::MINIMUM_FARE)
    end

    #Challenge 11
    it "resets entry station variable on touch out" do
      oystercard.top_up(Oystercard::MINIMUM_FARE)
      oystercard.touch_out
      expect(oystercard.entry_station).to eq nil
    end

  end

  # Challenge 11 - commented out
  # context "#in_journey?" do
  # 
  #   it "returns true when in a journey" do
  #     oystercard.top_up(Oystercard::MINIMUM_FARE)
  #     oystercard.touch_in(station)
  #     expect(oystercard.in_journey?).to eq true
  #   end
  #
  # end

end
