ActiveAdmin.register Game do

  permit_params :name, :release_date, :description, :genre, :price, :cover_art, :developer, :platform_id, :image

  form do |f|
    f.semantic_errors # shows errors on :base
    f.inputs
    f.inputs do
      f.input :release_date, as: :date_picker
      f.input :cover_art, as: :file, hint: f.object.cover_art.present? ? image_tag(f.object.image.variant(resize_to_limit: [600, 600])) : ""
    end
    f.actions         # adds the 'Submit' and 'Cancel' buttons
  end

end
