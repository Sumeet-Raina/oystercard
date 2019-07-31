class Oystercard
  attr_reader :balance, :entry_station, :exit_station

  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1
  MINIMUM_CHARGE = 1
  def initialize (balance = MAXIMUM_BALANCE)
    @balance = 0
    #replacing @in_use and rewriting in_journey method
    #@in_use = false
    @entry_station = nil
    @exit_station = nil
  end

  def top_up(amount)
    fail "Exceeded Maximum Balance" if amount + balance > MAXIMUM_BALANCE
    @balance += amount 
  end

  def in_journey?
    #@in_use
    !!entry_station 
  end

  def touch_in(entry_station)
   fail  "Insufficient balance to touch in" if @balance < MINIMUM_BALANCE
   #@in_use = true
   @entry_station = entry_station
  end

  def touch_out(exit_station)
    deduct(MINIMUM_CHARGE)
    @entry_station = nil
    @exit_station = exit_station
    #@in_use = false
  end
  private 
  def deduct(amount)
    @balance -= amount 
  end
end