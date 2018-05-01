require_relative 'meeting.rb'

class MeetingParser

  def self.parse(meetings_file)
    meetings = []
    File.open(meetings_file, "r") do |f|
      f.each_line do |meeting_line|
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
    meeting
  end
end