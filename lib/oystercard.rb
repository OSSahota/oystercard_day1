class Oystercard

  attr_reader :balance

  def initialize
    @balance = 0
  end

  def top_up(money)
    fail "Max balance allowed is £#{DEFAULT_CONSTANT}" if (@balance + money) > DEFAULT_CONSTANT
    @balance += money
  end

  private

  DEFAULT_CONSTANT = 90

end
