class AddSalePriceToGames < ActiveRecord::Migration[6.0]
  def change
    add_column :games, :sale_price, :decimal
  end
end