class Oystercard

  attr_reader :balance, :journey_status

  def initialize
    @balance = 0
    @journey_status = false
  end

  def top_up(money)
    fail "Max balance allowed is £#{MAX_BALANCE}" if max?(money)
    @balance += money
  end

  def deduct(amount)
    @balance -= amount
  end

  def touch_in
    fail "Balance is too low" if @balance < MINIMUM_FARE
    @journey_status = true
  end

  def touch_out
    @journey_status = false
  end

  def in_journey?
    @journey_status
  end

  private
  MAX_BALANCE = 90
  MINIMUM_FARE = 1

  def max?(money)
    (@balance + money) > MAX_BALANCE
  end

end
