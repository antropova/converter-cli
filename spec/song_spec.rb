describe Song do
  before(:each) do
    Song.reset_all
  end

  let(:song) { Song.new }

  it 'finds a song object by name' do
    song.name = "Find Me"
    expect(Song.find_by_name('Find Me')).to eq(song)
  end

  it 'creates a song object by name' do
    expect(Song.create_by_name('Find Me').name).to eq('Find Me')
  end

  it "can initialize a song" do
    expect(song).to be_a(Song)
  end

  it "can have a name" do
    song.name = "Jump Around"
    expect(song.name).to eq("Jump Around")
  end

  it "can have a genre" do
    song.genre = Genre.new.tap {|g| g.name = "rap"}
    expect(song.genre.name).to eq("rap")
    expect(song.genre).to be_a(Genre)
  end

  it "has an artist" do
    song.artist = Artist.new.tap {|a| a.name = "miley"}
    expect(song.artist).to be_a(Artist)
    expect(song.artist.name).to eq("miley")
  end

  it 'has a nice to_s format' do
    song.name = "We Can't Stop"
    song.artist = Artist.new.tap {|a| a.name = "Miley Cyrus"}
    song.genre = Genre.new.tap {|g| g.name = "Pop"}
    expect(song.to_s).to eq("Miley Cyrus - We Can't Stop [Pop]")
  end

  it "can reset all songs" do
    Song.reset_all
    expect(Song.count).to eq(0)
  end

  it "keeps track of the songs that have been created" do
    expect(Song.all).to include(song)
  end

end
