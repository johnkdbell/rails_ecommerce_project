class ShoppingCart

  def initialize(token:)
    @token = token
  end

  def order
    @order ||= Order.find_or_create_by(token: @token) do |order|
      order.total_price = 0
    end
  end

  def items_count
    order.ordered_games.sum(:quantity)
  end

  def add_item(game_id:, quantity: 1)
    game = Game.find(game_id)

    ordered_game = order.ordered_games.find_or_initialize_by(
      game_id: game_id
    )

    ordered_game.unit_price = game.price
    ordered_game.quantity = quantity

    ordered_game.save
  end

  def remove_item(id:)
    order.ordered_games.destroy(id)
  end

end