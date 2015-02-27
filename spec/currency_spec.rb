describe AmountWithCurrency do
  describe "#call" do
    it "should return an array" do
      with_currency = AmountWithCurrency.new("20 rub")
      expect(with_currency.call).to be_an(Array)
    en
  end
end































# describe Artist do
#   before(:each) do
#     Artist.reset_all
#   end

#   let(:artist){Artist.new}
#   let(:song){Song.new}
#   let(:genre){Genre.new}

#   it "can be initialized" do
#     expect(Artist.new).to be_an_instance_of(Artist)
#   end

#   it "can have a name" do
#     artist = Artist.new
#     artist.name = "Adele"
#     expect(artist.name).to eq("Adele")
#   end



# end
