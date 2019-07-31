class Oystercard
  attr_reader :balance 
  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1
  MINIMUM_CHARGE = 1
  def initialize (balance = MAXIMUM_BALANCE)
    @balance = 0
    @in_use = false
  end

  def top_up(amount)
    fail "Exceeded Maximum Balance" if amount + balance > MAXIMUM_BALANCE
    @balance += amount 
  end

  def in_journey?
    @in_use
  end

  def touch_in
   fail  "Insufficient balance to touch in" if @balance < MINIMUM_BALANCE
   @in_use = true
  end

  def touch_out
    deduct(MINIMUM_CHARGE)
    @in_use = false
  end
  private 
  def deduct(amount)
    @balance -= amount 
  end
end