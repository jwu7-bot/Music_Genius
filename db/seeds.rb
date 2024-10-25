require "open-uri"
require "json"
require "faker"
require "dotenv/load"

Track.delete_all
Genre.delete_all
Artist.delete_all

BASE_URL = "http://ws.audioscrobbler.com/2.0/"

api_key = ENV["LASTFM_API_KEY"]

6.times do
  # use faker to generate random music genres
  genre_name = Faker::Music.genre

  # find or create the genre
  genre = Genre.find_or_create_by(name: genre_name)

  url = "#{BASE_URL}?method=tag.gettoptracks&tag=#{genre_name}&api_key=#{api_key}&format=json"

  begin
    # fetch the API response
    response = URI.open(url).read
    json_data = JSON.parse(response)

    json_data["tracks"]["track"].each do |track|
      track_name = track["name"]
      track_duration = track["duration"]
      artist_name = track["artist"]["name"]

      # find or create the artist
      artist = Artist.find_or_create_by(name: artist_name)

      # create the track associated with the artist and genre
      Track.find_or_create_by(name: track_name, duration: track_duration, artist: artist, genre: genre)
    end
  end
end

puts "There are #{Track.count} Tracks"
puts "There are #{Artist.count} Artists"
puts "There are #{Genre.count} Genres"
