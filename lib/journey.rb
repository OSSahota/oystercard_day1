require './lib/oystercard'

class Journey

  attr_reader :entry_station, :journey_history

  def initialize(oystercard=Oystercard.new)
    @entry_station = []
    @journey_history = {}
    @oystercard = oystercard
  end

  def touch_in(station)
    fail "Balance is too low" if @balance < MIN_BALANCE
    @entry_station = station
  end

  def touch_out(exit_station)
    deduct(MINIMUM_FARE)
    @journey_history.store(@entry_station, exit_station)
    @entry_station = [] # ask coach why .pop fails RSpec
  end

  def in_journey?
    @entry_station
  end

end
