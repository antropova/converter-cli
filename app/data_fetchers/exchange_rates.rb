# require 'pry'
# require 'json'
# require "open-uri"

# class ExchangeRates

#   attr_reader :currency_data

#   # example url:
#   # "https://openexchangerates.org/api/latest.json?app_id=3fb2b129f6b64345a150612f6362b1fb"
  
#   def initialize
#     @latest_url = "https://openexchangerates.org/api/latest.json?app_id=3fb2b129f6b64345a150612f6362b1fb"
#     @rates = JSON.load(open(@latest_url))
#     binding.pry    
#   end

#   # def make_songs
#   #   songs = []
#   #   all_songs = music_data["tracks"]
#   #   all_songs.each do |song|
#   #     song_url = song["track_url"]
#   #     songs << ExampleModel.new(song_url)
#   #   end
#   #   songs
#   # end

# end

# ExchangeRates.new