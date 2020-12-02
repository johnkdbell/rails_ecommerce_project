ActiveAdmin.register OrderedGame do

  permit_params :unit_price, :quantity, :game_id, :order_id

end
