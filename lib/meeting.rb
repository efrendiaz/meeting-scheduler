class Meeting < Base
  attr_accessor :title, :duration, :begin_time

  def to_s
    duration.nil? ? "#{begin_time_to_human} #{title}" : "#{begin_time_to_human} #{title} #{duration}min"
  end

  def begin_time_to_human
    hour =  "%02d" % begin_time.to_i
    minutes = decimal_to_minutes(begin_time.modulo(1))
    begin_time >= 9 ? "#{hour}:#{minutes}AM" : "#{hour}:#{minutes}PM"
  end

  def decimal_to_minutes(n)
    "%02d" % (n * 60).to_i
  end
end