describe 'Something' do

  # before(:each) usually goes up top, for example:
  # before(:each) do
  #   Genre.reset_all
  # end

  # let statements usually go here, for example:
  # let(:artist) { Artist.new }

  # it statements look like this:
  # it "can have a song added" do
  #   artist.add_song(song)
  #   expect(artist.songs).to include(song)
  # end

  it "I changed this boolean to true when I finished this lab" do
    done = true
    expect(done).to eq(true)
  end

end
