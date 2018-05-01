describe 'Meeting' do
  let(:meeting){Meeting.new(begin_time: 9, duration: 60, title: "Awesome Meeting")}

  it "should output the time as AM if it's between 9 and 12" do
    expect(meeting.to_s).to eql("09:00AM Awesome Meeting 60min")

    meeting.begin_time = 11.75
    meeting.duration = 15
    meeting.title = "Awesome Meeting 2"

    expect(meeting.to_s).to eql("11:45AM Awesome Meeting 2 15min")

  end

  it "should handle fractions of the hour correctly" do

    meeting.begin_time = 9.25
    meeting.duration = 60
    meeting.title = "Awesome Meeting"

    expect(meeting.to_s).to eql("09:15AM Awesome Meeting 60min")

    meeting.begin_time = 9.5
    meeting.duration = 30
    meeting.title = "Awesome Meeting 2"

    expect(meeting.to_s).to eql("09:30AM Awesome Meeting 2 30min")

    meeting.begin_time = 9.75
    meeting.duration = 15
    meeting.title = "Awesome Meeting 3"

    expect(meeting.to_s).to eql("09:45AM Awesome Meeting 3 15min")
  end

  it "should output the time as AM if it's between 1 and 5" do
    meeting.begin_time = 1
    meeting.duration = 60
    meeting.title = "Awesome Meeting"

    expect(meeting.to_s).to eql("01:00PM Awesome Meeting 60min")

    meeting.begin_time = 4.75
    meeting.duration = 15
    meeting.title = "Awesome Meeting 2"

    expect(meeting.to_s).to eql("04:45PM Awesome Meeting 2 15min")

  end

end
