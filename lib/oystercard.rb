class Oystercard

  attr_reader :balance

  def initialize
    @balance = 0
  end

  def top_up(money)
    fail "Max balance allowed is £#{MAX_BALANCE}" if max?(money)
    @balance += money
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

  # def min_balance?
  #   @balance < MIN_BALANCE
  # end

end
