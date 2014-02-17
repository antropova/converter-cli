require_relative 'spec_helper.rb'

describe Genre do
  before(:each) do
    Genre.reset_all
  end

  let(:genre){Genre.new}

  it "can initialize a genre" do
    genre.should be_an_instance_of(Genre)
  end

  it "has a name" do
    genre.name = 'rap'
    genre.name.should eq('rap')
  end

  it "has many songs" do
    genre = Genre.new.tap { |g| g.name = 'rap' }
    3.times do
      song = Song.new
      song.genre = genre
    end
    genre.songs.count.should eq(3)
  end

  it "has many artists" do
    genre = Genre.new
    genre.name = 'rap'

    2.times do
      artist = Artist.new
      song = Song.new.tap { |s| s.genre = genre }
      artist.add_song(song)
    end

    genre.artists.count.should eq(2)
  end

  it "keeps unique artists" do
    genre = Genre.new.tap{|g| g.name = 'rap'}
    artist = Artist.new

    [1,2].each do
      song = Song.new
      song.genre = genre
      artist.add_song(song)
    end
    genre.artists.count.should eq(1)
  end

  describe "Class methods" do
    it "keeps track of all known genres" do
      Genre.count.should eq(0)
      rap = Genre.new.tap{|g| g.name = 'rap'}
      electronica = Genre.new.tap{|g| g.name = 'electronica'}
      Genre.count.should eq(2)
      Genre.all.should include(rap)
      Genre.all.should include(electronica)
    end

    it "can reset genres" do
      genres = (1..5).collect do |i|
        Genre.new
      end
      Genre.count.should eq(5)
      Genre.reset_all
      Genre.count.should eq(0)
    end

    it 'finds an genre by name' do
      genre.name = "Find Me"
      Genre.find_by_name('Find Me').should eq(genre)
    end

    it 'creates an genre by name' do
      Genre.create_by_name('Find Me').name.should eq('Find Me')
    end
  end
end
