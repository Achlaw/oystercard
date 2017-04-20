require_relative 'journey'
require_relative 'station'

class Oystercard

  MAX_BALANCE = 90
  MIN_BALANCE = 1
  PENALTY_FARE = 6

  attr_reader :balance, :entry_station, :exit_station

  def initialize
    @journey = Journey.new
  	@balance = 0

  end

  def top_up(amount)
    message = "ERROR: balance over maximum limit of #{MAX_BALANCE}"
    fail message if @balance + amount > MAX_BALANCE
  	@balance = @balance + amount
  end

  def touch_in(entry_station)
    fail "Insufficient balance." if @balance < MIN_BALANCE
@journey.begin_journey(entry_station)

  end


  def touch_out(exit_station)
    deduct(MIN_BALANCE)
  @journey.final_journey(exit_station)
  end

  private
  def deduct(amount)
    @balance = @balance - amount
  end

end
