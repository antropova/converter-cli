require_relative 'spec_helper.rb'

describe Song do
  before(:each) do
    Song.reset_all
  end

  let(:song) { Song.new }

  it 'finds an artist by name' do
    song.name = "Find Me"
    Song.find_by_name('Find Me').should eq(song)
  end

  it 'creates an artist by name' do
    Song.create_by_name('Find Me').name.should eq('Find Me')
  end

  it "can initialize a song" do
    song.should be_a(Song)
  end

  it "can have a name" do
    song.name = "Jump Around"
    song.name.should eq("Jump Around")
  end

  it "can have a genre" do
    song.genre = Genre.new.tap {|g| g.name = "rap"}
    song.genre.name.should eq("rap")
    song.genre.should be_a(Genre)
  end

  it "has an artist" do
    song.artist = Artist.new.tap {|a| a.name = "miley"}
    song.artist.should be_a(Artist)
    song.artist.name.should eq("miley")
  end

  it 'has a nice to_s format' do
    song.name = "We Can't Stop"
    song.artist = Artist.new.tap {|a| a.name = "Miley Cyrus"}
    song.genre = Genre.new.tap {|g| g.name = "Pop"}
    "#{song}".should eq("Miley Cyrus - We Can't Stop [Pop]")
  end

  it "can reset all songs" do
    Song.reset_all
    Song.count.should eq(0)
  end

end
