class ConferenceRoom < Base
  attr_accessor :meetings, :name

  def available_slots
    [morning_block, afternoon_block]
  end

  def morning_block
    @morning||= TimeBlock.new(begin_time: 9, available_time: 180)
  end

  def afternoon_block
    @afternoon||= TimeBlock.new(begin_time: 1, available_time: 240)
  end


  def book(meeting)
    self.meetings||= []

    # If there is an available slot, find the first one and book the time
    if available_slot?(meeting.duration)
      first_available_slot = available_slots.select{|slot| slot.available_time >= meeting.duration}.first
      self.meetings << first_available_slot.book(meeting)
    end
 end

  def available_slot?(duration)
    available_slots.any?{|slot| slot.available_time >= duration}
  end

  def report
    output = []
    # Add morning meetings first
    meetings.select{|m| m.begin_time >= 9 && m.begin_time < 12}.each{|m| output << m.to_s}

    # Add Lunch
    output <<  Meeting.new(title: "Lunch", begin_time: 12).to_s

    # Add afternoon meetings
    meetings.select{|m| m.begin_time >= 1 && m.begin_time < 5}.each{|m| output << m.to_s}
    output.join("\n")
  end
end