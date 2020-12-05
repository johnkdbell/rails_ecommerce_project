class RemoveGameGenre < ActiveRecord::Migration[6.0]
  def change
    drop_table :game_genres
  end
end
