class RemoveGenreIdFromTracks < ActiveRecord::Migration[7.2]
  def change
    remove_column :tracks, :genre_id, :integer
  end
end
