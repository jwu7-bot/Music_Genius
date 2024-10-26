class CreateJoinTableGenresTracks < ActiveRecord::Migration[7.2]
  def change
    create_join_table :genres, :tracks do |t|
       t.index [ :genre_id, :track_id ]
       t.index [ :track_id, :genre_id ]
    end
  end
end
