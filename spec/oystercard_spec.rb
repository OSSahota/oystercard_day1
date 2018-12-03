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
      expect(oystercard).to respond_to(:top_up).with(1).arguments
    end

    it 'tops up your oystercard' do
      expect{oystercard.top_up(5)}.to change{oystercard.balance}.from(0).to(5)
    end

  end

end
