class TracksController < ApplicationController
  def index
    # fetch all tracks
    @tracks = Track.includes(:artist, :genre).order(:name).paginate(page: params[:page], per_page: 25)
  end

  def show
    # fetch individual tracks
    @track = Track.find(params[:id])
  end
end
