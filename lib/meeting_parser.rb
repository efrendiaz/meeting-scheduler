class InvalidFormat < StandardError
end


class MeetingParser

  def self.parse(meetings_file)
    meetings = []
    File.open(meetings_file, "r") do |f|
      f.each_line do |meeting_line|
        # Convert text in an object representation of a meeting that needs to be scheduled
        meetings << create_meeting(meeting_line)
      end
    end
    meetings
  end

  def self.create_meeting(meeting_line)
    duration_string =  meeting_line.split(" ").last
    meeting = Meeting.new
    meeting.duration = duration_string.gsub("min","").to_i
    meeting.title = meeting_line.gsub( duration_string, "").rstrip
    raise InvalidFormat , "Meeting is invalid #{meeting.inspect}" unless meeting.valid?
    meeting
  end
end