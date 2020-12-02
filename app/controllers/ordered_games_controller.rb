class OrderedGamesController < ApplicationController
  def index
    @items = current_cart.order.ordered_games
  end

  def create
    current_cart.add_item(
      game_id: params[:game_id],
      quantity: params[:quantity]
    )

    redirect_to cart_path
  end

  def destroy
    current_cart.remove_item(id: params[:id])
    redirect_to cart_path
  end
end
