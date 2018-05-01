describe 'ConferenceRoom' do

  let(:meeting1){Meeting.new(title: "Awesome Meeting 1", duration: 60)}
  let(:meeting2){Meeting.new(title: "Awesome Meeting 2", duration: 45)}
  let(:meeting3){Meeting.new(title: "Awesome Meeting 3", duration: 30)}
  let(:meeting4){Meeting.new(title: "Awesome Meeting 4", duration: 30)}
  let(:meeting5){Meeting.new(title: "Awesome Meeting 5", duration: 60)}
  let(:room1){ConferenceRoom.new(name: "Room #{}1")}

  context "#book" do
    it "should book the meeting on the next available slot" do
      room1.book(meeting1)
      room1.book(meeting2)
      room1.book(meeting3)
      expect(room1.report).to eql("09:00AM Awesome Meeting 1 60min\n10:00AM Awesome Meeting 2 45min\n10:45AM Awesome Meeting 3 30min")
    end

    it "shoudl book meetings in the afternoon if morning is full" do
      room1.book(meeting1)
      room1.book(meeting2)
      room1.book(meeting3)
      room1.book(meeting4)
      room1.book(meeting5)
      expect(room1.report).to eql("09:00AM Awesome Meeting 1 60min\n10:00AM Awesome Meeting 2 45min\n10:45AM Awesome Meeting 3 30min\n11:15AM Awesome Meeting 4 30min\n12:00AM Lunch\n01:00PM Awesome Meeting 5 60min")
    end
  end
end