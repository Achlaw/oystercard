class Journey

  attr_reader :journey_history, :start_journey, :end_journey

  def initialize(entry_station = nil, exit_station = nil)
    @entry_station = entry_station
    @exit_station = exit_station
    @journey_history = []
  end

# def initialize
#   @journey_history = []
# end
#
# def entry_station
#   @entry_station = entry_station
#   end
#
# def exit_station
#    @exit_station = exit_station
#    journey_record
#    @entry_station = nil
#  end
#
#  def journey_record
#    @journey_history << { entry_station: @entry_station, exit_station: @exit_station }
#  end

def begin_journey(entry_station)
  @entry_station = entry_station

end

def final_journey(exit_station)
  @exit_station = exit_station
  journey_record
end

def in_journey?
  @entry_station != nil
end

def journey_record
   @journey_history << { entry_station: @entry_station, exit_station: @exit_station }
end
end
