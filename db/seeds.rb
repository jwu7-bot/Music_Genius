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

  url = "#{BASE_URL}?method=tag.gettoptracks&tag=#{genre_name}&api_key=#{api_key}&format=json"

  # fetch the API response
  response = URI.open(url).read
  json_data = JSON.parse(response)

  json_data["tracks"]["track"].each do |track_data|
    track_name = track_data["name"]
    track_duration = track_data["duration"]
    track_artist = track_data["artist"]["name"]

    # find or create the genre
    genre = Genre.find_or_create_by(name: genre_name)

    # find or create the artist
    artist = Artist.find_or_create_by(name: track_artist)

    # create the track associated with the artist and genre
    track = Track.find_or_create_by(name: track_name, duration: track_duration, artist: artist)

    track.genres << genre unless track.genres.include?(genre)
  end
end

puts "There are #{Track.count} Tracks"
puts "There are #{Artist.count} Artists"
puts "There are #{Genre.count} Genres"
