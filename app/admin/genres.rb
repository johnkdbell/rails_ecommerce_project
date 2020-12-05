ActiveAdmin.register Genre do

  permit_params :genre_name, game_genres: [:id, :game_id, :genre_id, :_destroy]

  index do
    selectable_column
    column :id
    column :genre_name
    column :games do |video_game|
      video_game.games.map { |vg| vg.name }.join(", ").html_safe
    end
    column :created_at
    column :updated_at
    actions
  end


end
