describe Artist do
  before(:each) do
    Artist.reset_all
  end

  let(:artist){Artist.new}
  let(:song){Song.new}
  let(:genre){Genre.new}

  it "can be initialized" do
    expect(Artist.new).to be_an_instance_of(Artist)
  end

  it "can have a name" do
    artist = Artist.new
    artist.name = "Adele"
    expect(artist.name).to eq("Adele")
  end

  describe "Class methods" do
    it "keeps track of the artists that have been created" do
      expect(Artist.all).to include(artist)
    end

    it "can count how many artists have been created" do
      Artist.new
      expect(Artist.count).to eq(1)
    end

    it "can reset the artists that have been created" do
      Artist.reset_all #you may need to do this before every test
      expect(Artist.count).to eq(0)
    end

    it 'finds an artist by name' do
      artist.name = "Find Me"
      expect(Artist.find_by_name('Find Me')).to eq(artist)
    end

    it 'creates an artist by name' do
      expect(Artist.create_by_name('Find Me').name).to eq('Find Me')
    end
  end

  describe "with songs" do
    it "can have a song added" do
      artist.add_song(song)
      expect(artist.songs).to include(song)
    end

    it "can add multiple songs at once" do
      artist.add_songs([song, Song.new])
     expect(artist.songs.count).to eq(2)
    end
  end

  describe "with genres" do
    it "can have genres" do
      song.genre = genre
      artist.add_song song
      expect(artist.genres).to include(genre)
    end
  end

end
