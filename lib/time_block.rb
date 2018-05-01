class TimeBlock < Base
  attr_accessor :begin_time, :available_time

  def book(meeting)
    return nil if meeting.duration > self.available_time

    # Substract the time for the meeting
    self.available_time  = self.available_time - meeting.duration
    # Set a begin time for the meeting before changing the begin time of the block
    meeting.begin_time = self.begin_time
    # Adjust the begin time using decimar to represent minutes
    self.begin_time = self.begin_time + duration_to_decimals(meeting.duration)
    meeting
  end

  def duration_to_decimals(duration)
    duration.to_f / 60.0
  end

end