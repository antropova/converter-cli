require_relative 'spec_helper.rb'

describe "LibraryParser" do
  before(:each) do
    Artist.reset_all
    Song.reset_all
    Genre.reset_all
  end

  let(:parser){LibraryParser.new('spec/fixtures/mp3s')}

  it 'loads files from a directory' do
    expect(parser.files).to_not be_empty
    expect(parser.files.size).to eq(1)
  end

  it 'parses a filename into 3 parts' do
    parts = parser.parse_filename('Action Bronson - Larry Csonka [indie].mp3')
    expect(parts[0]).to eq('Action Bronson')
    expect(parts[1]).to eq('Larry Csonka')
    expect(parts[2]).to eq('indie')
  end

  it 'builds a song based on song parts' do
    parts = ['Action Bronson', 'Larry Csonka', 'indie']
    song = parser.build_song(parts[0], parts[1], parts[2])

    expect(Artist.find_by_name(parts[0])).to eq(song.artist)
    expect(Song.find_by_name(parts[1])).to eq(song)
    expect(Genre.find_by_name(parts[2])).to eq(song.genre)
  end

  it 'will parse all songs in a directory' do
    parser.parse

    expect(Artist.all).to_not be_empty
    expect(Genre.all).to_not be_empty
    expect(Song.all).to_not be_empty
  end
end
