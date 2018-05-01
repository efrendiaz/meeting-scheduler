class TimeBlock < Base
  attr_accessor :begin_time, :available_time

  def book(meeting)
    return nil if meeting.duration > self.available_time
    self.available_time  = self.available_time - meeting.duration
    meeting.begin_time = self.begin_time
    self.begin_time = self.begin_time + duration_to_decimals(meeting.duration)
    meeting
  end

  def duration_to_decimals(duration)
    duration.to_f / 60.0
  end

end