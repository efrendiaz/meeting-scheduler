describe 'MeetingParser' do

  before do
    File.open("meetings_test.txt", "w") do |f|
      f.puts("Marketing presentation 30min")
      f.puts("Ruby presentation 45min")
    end
  end

  it 'it parses meetings correctly' do
    meetings = MeetingParser.parse("meetings_test.txt")
    expect(meetings.first.duration).to eql(30)
    expect(meetings.first.title).to eql("Marketing presentation")
    expect(meetings.last.duration).to eql(45)
    expect(meetings.last.title).to eql("Ruby presentation")
  end
end