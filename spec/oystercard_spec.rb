require 'oystercard'

describe Oystercard do
  let(:oystercard) {Oystercard.new}

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
      expect{oystercard.top_up(5)}.to change{oystercard.balance}.from(0).to(5)
    end

    it 'Blocks top up if over the limit' do
      expect{oystercard.top_up(Oystercard::DEFAULT_CONSTANT + 1)}.to raise_error "Max balance allowed is £#{Oystercard::DEFAULT_CONSTANT}"
    end

  end

  context '#deduct' do

    it "deducts money from your oystercard" do
      oystercard.top_up(5)
      expect{oystercard.deduct(5)}.to change{oystercard.balance}.from(5).to(0)
    end

  end

end
