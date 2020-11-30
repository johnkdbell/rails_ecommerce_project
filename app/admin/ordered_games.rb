ActiveAdmin.register OrderedGame do

  permit_params :purchase_price, :quantity, :game_id, :order_id

end
