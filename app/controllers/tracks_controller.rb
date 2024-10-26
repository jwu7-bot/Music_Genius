class TracksController < ApplicationController
  def index
    # fetch all tracks
    @tracks = Track.includes(:artist).order(:name).paginate(page: params[:page], per_page: 25)
  end

  def show
    # fetch individual tracks
    @track = Track.includes(:genres).find(params[:id])
  end

  def search
    if params[:query].present?
      @tracks = Track.joins(:artist, :genres)
                     .where("tracks.name LIKE ? OR artists.name LIKE ? OR genres.name LIKE ?",
                            "%#{params[:query]}%", "%#{params[:query]}%", "%#{params[:query]}%")
                     .distinct.order(:name).paginate(page: params[:page], per_page: 25)
    else
      @tracks = Track.all.order(:name).paginate(page: params[:page], per_page: 25)
    end
  end
end
