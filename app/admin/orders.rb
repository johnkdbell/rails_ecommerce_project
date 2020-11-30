ActiveAdmin.register Order do

  permit_params :total_price, ordered_games: [:id, :game_id, :order_id, :_destroy]

  index do
    selectable_column
    column :id
    column :total_price
    column :games do |board_game|
      board_game.games.map { |bg| bg.name }.join(", ").html_safe
    end
    column :created_at
    column :updated_at
    actions
  end

  show do |game|
    attributes_table do
      row :total_price
      row :games do |board_game|
        board_game.games.map { |bg| bg.name }.join(", ").html_safe
      end
    end
  end


end
