class GenresController < ApplicationController
  def index
    @genres = Genre.order(:name)
  end

  def show
    @genre = Genre.find(params[:id])
    @tracks = @genre.tracks.order(:name).paginate(page: params[:page], per_page: 15)
  end
end
