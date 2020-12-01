ActiveAdmin.register Game do

  permit_params :name, :release_date, :description, :genre, :price, :cover_art, :developer,
                :platform_id, :sale_price, :on_sale, :image, ordered_games: [:id, :game_id, :order_id, :_destroy]


  index do
    selectable_column
    column :id
    column :name
    column :release_date
    column :genre
    column :price
    column :on_sale
    column :sale_price
    column :developer
    column :platform_id
    column :created_at
    column :updated_at
    actions
  end

  form do |f|
    f.semantic_errors # shows errors on :base
    f.inputs
    f.inputs do
      f.input :release_date, as: :date_picker
      f.input :image, as: :file, hint: f.object.image.present? ? image_tag(f.object.image.variant(resize_to_limit: [600, 600])) : ""
      f.has_many :ordered_games, allow_destroy: true do |n_f|
        n_f.input :order
      end
    end
    f.actions         # adds the 'Submit' and 'Cancel' buttons
  end

end
