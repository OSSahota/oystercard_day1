class Oystercard

  attr_reader :balance, :entry_station, :journey_history
  # :journey_status,

  def initialize
    @balance = 0
    # @journey_status = false
    @entry_station = []
    @journey_history = {}
  end

  def top_up(money)
    fail "Max balance allowed is £#{MAX_BALANCE}" if max?(money)
    @balance += money
  end

  def touch_in(station)
    fail "Balance is too low" if @balance < MIN_BALANCE
    # @journey_status = true
    @entry_station = station
  end

  def touch_out(exit_station)
    deduct(MINIMUM_FARE)
    # @journey_status = false
    #@entry_station = nil
    @journey_history.store(@entry_station, exit_station)
    @entry_station = [] # ask coach why .pop fails RSpec
  end

  # Commented out as part of challenge 11
  # def in_journey?
  #   @journey_status
  # end

  def in_journey?
    @entry_station
  end

  private
  MAX_BALANCE = 90
  MINIMUM_FARE = 1
  MIN_BALANCE = 1

  def max?(money)
    (@balance + money) > MAX_BALANCE
  end

  def deduct(amount)
    @balance -= amount
  end

end
