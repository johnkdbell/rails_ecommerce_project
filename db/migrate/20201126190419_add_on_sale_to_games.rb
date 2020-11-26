class AddOnSaleToGames < ActiveRecord::Migration[6.0]
  def change
    add_column :games, :on_sale, :boolean
  end
end