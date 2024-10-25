class HomeController < ApplicationController
  def index
    @tracks = Track.all.limit(10)

    @artists = Artist.all.limit(10)

    @genres = Genre.includes(tracks: :artist).all
  end
end
