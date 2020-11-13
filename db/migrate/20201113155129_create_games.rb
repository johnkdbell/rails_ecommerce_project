class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.string :name
      t.string :release_date
      t.text :description
      t.string :genre
      t.decimal :price
      t.string :cover_art
      t.string :developer
      t.references :platform, null: false, foreign_key: true

      t.timestamps
    end
  end
end
