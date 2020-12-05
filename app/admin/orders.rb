ActiveAdmin.register Order do

  permit_params :total_price, ordered_games_attributes: [:id, :game_id, :order_id, :_destroy]

  index do
    selectable_column
    column :id
    column :total_price
    column :games do |video_game|
      video_game.games.map { |vg| vg.name }.join(", ").html_safe
    end
    column :created_at
    column :updated_at
    actions
  end

  show do |game|
    attributes_table do
      row :total_price
      row :games do |video_game|
        video_game.games.map { |vg| vg.name }.join(", ").html_safe
      end
    end
  end


end
