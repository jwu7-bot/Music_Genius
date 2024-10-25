class ArtistsController < ApplicationController
  def index
    # fetch artists
    @artists = Artist.order(:name).paginate(page: params[:page], per_page: 25)
  end

  def show
    # fecth individual artists
    @artist = Artist.find(params[:id])
  end
end
