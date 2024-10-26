class TracksController < ApplicationController
  def index
    # fetch all tracks
    @tracks = Track.includes(:artist).order(:name).paginate(page: params[:page], per_page: 25)
  end

  def show
    # fetch individual tracks
    @track = Track.includes(:genres).find(params[:id])
  end
end
