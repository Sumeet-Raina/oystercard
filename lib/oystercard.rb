class Oystercard
  attr_reader :balance, :entry_station, :exit_station, :journeys

  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1
  MINIMUM_CHARGE = 1
  def initialize (balance = MAXIMUM_BALANCE)
    @balance = 0
    @journeys = [] 
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
    @exit_station = exit_station
    @journeys << {entry: @entry_station, exit: @exit_station} 
    entry_station = nil
  end
  private 
  def deduct(amount)
    @balance -= amount 
  end
end