require 'oystercard'

describe Oystercard do

  context '#balance' do

    let(:oystercard) {Oystercard.new(100)}

    it 'card has money' do
      expect(oystercard.balance).to eq 100
    end
  end

end
