class SpotifyChart

  attr_reader :url, :music_data

  # example url:
  # "http://charts.spotify.com/api/tracks/most_streamed/us/weekly/latest"
  
  def initialize(url)
    @url = url
    @music_data = JSON.load(open(url))
  end

  def make_songs
    songs = []
    all_songs = music_data["tracks"]
    all_songs.each do |song|
      song_url = song["track_url"]
      songs << ExampleModel.new(song_url)
    end
    songs
  end

end
