class Oystercard

  MAX_BALANCE = 90
  MIN_BALANCE = 1

  attr_reader :balance, :entry_station, :exit_station, :journey_history

  def initialize
  	@balance = 0
    @journey_history = []
  end

  def top_up(amount)
    message = "ERROR: balance over maximum limit of #{MAX_BALANCE}"
    fail message if @balance + amount > MAX_BALANCE
  	@balance = @balance + amount
  end

  def touch_in(entry_station)
    fail "Insufficient balance." if @balance < MIN_BALANCE
    @entry_station = entry_station
  end

  def touch_out(exit_station)
    deduct(MIN_BALANCE)
    @exit_station = exit_station
    journey_record
    @entry_station = nil
  end

  def in_journey?
    @entry_station != nil
  end

  def journey_record
    @journey_history << { entry_station: @entry_station, exit_station: @exit_station }
  end

  private
  def deduct(amount)
    @balance = @balance - amount
  end

end
