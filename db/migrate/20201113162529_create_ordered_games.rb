class CreateOrderedGames < ActiveRecord::Migration[6.0]
  def change
    create_table :ordered_games do |t|
      t.decimal :purchase_price
      t.integer :quantity
      t.references :game, null: false, foreign_key: true
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
