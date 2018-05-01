describe 'TimeBlock' do

  let(:meeting){Meeting.new}

  it "should deduct time and adjust begin time" do
    morning = TimeBlock.new(begin_time: 9, available_time: 180)

    meeting.duration = 45
    morning.book(meeting)
    expect(morning.begin_time).to eql(9.75)
    expect(morning.available_time).to eql(135)

    meeting.duration = 60
    morning.book(meeting)
    expect(morning.begin_time).to eql(10.75)
    expect(morning.available_time).to eql(75)

    meeting.duration = 30
    morning.book(meeting)
    expect(morning.begin_time).to eql(11.25)
    expect(morning.available_time).to eql(45)

    meeting.duration = 45
    morning.book(meeting)
    expect(morning.begin_time).to eql(12.0)
    expect(morning.available_time).to eql(0)

  end

  it "should return nil when slot can't be booked" do
    morning = TimeBlock.new(begin_time: 9, available_time: 180)
    meeting.duration = 195
    expect(morning.book(meeting)).to be nil
  end

  it "should return a meeting object with the begin time set" do
    morning =  TimeBlock.new(begin_time: 9, available_time: 180)

    meeting.duration = 45
    expect(morning.book(meeting).begin_time).to eql(9)

    meeting.duration = 30
    expect(morning.book(meeting).begin_time).to eql(9.75)

    meeting.duration = 30
    expect(morning.book(meeting).begin_time).to eql(10.25)

  end


end