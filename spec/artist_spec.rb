require_relative 'spec_helper.rb'

describe Artist do
  let(:artist){Artist.new}
  let(:song){Song.new}
  let(:genre){Genre.new}

  it_behaves_like 'findable'

  it "can be initialized" do
    Artist.new.should be_an_instance_of(Artist)
  end

  it 'has a url' do
    artist.name = "Bob Whitney"
    artist.url.should eq("bob-whitney.html")
  end

  it "can have a name" do
    artist = Artist.new
    artist.name = "Adele"
    artist.name.should eq("Adele")
  end

  describe "Class methods" do
    it "keeps track of the artists that have been created" do
      Artist.all.should include(artist)
    end

    it "can count how many artists have been created" do
      Artist.new
      Artist.count.should eq(1)
    end

    it "can reset the artists that have been created" do
      Artist.count.should eq(0)
    end
  end

  describe "with songs" do
    it "can have a song added" do
      artist.add_song(song)
      artist.songs.should include(song)
    end

    it "knows how many songs it has" do
      artist.add_songs([song, Song.new])
      artist.songs.count.should eq(2)
    end
  end

  describe "with genres" do
    it "can have genres" do
      song.genre = genre
      artist.add_song song
      artist.genres.should include(genre)
    end
  end

end
