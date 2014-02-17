require_relative 'spec_helper.rb'

describe "LibraryParser" do
  before(:each) do
    Artist.reset_all
    Song.reset_all
    Genre.reset_all
  end

  let(:parser){LibraryParser.new('spec/fixtures/mp3s')}

  it 'loads files from a directory' do
    parser.files.should_not be_empty
    parser.files.size.should eq(1)
  end

  it 'parses a filename into 3 parts' do
    parts = parser.parse_filename('Action Bronson - Larry Csonka [indie].mp3')
    parts[0].should eq('Action Bronson')
    parts[1].should eq('Larry Csonka')
    parts[2].should eq('indie')
  end

  it 'builds a song based on song parts' do
    parts = ['Action Bronson', 'Larry Csonka', 'indie']
    song = parser.build_song(parts[0], parts[1], parts[2])

    Artist.find_by_name(parts[0]).should eq(song.artist)
    Song.find_by_name(parts[1]).should eq(song)
    Genre.find_by_name(parts[2]).should eq(song.genre)
  end

  it 'will parse all songs in a directory' do
    parser.parse

    Artist.all.should_not be_empty
    Genre.all.should_not be_empty
    Song.all.should_not be_empty
  end
end
