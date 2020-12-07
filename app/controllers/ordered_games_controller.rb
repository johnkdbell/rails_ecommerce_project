class OrderedGamesController < ApplicationController
  def index
    @items = @current_cart.order.ordered_games
  end

  def create
    current_cart.add_item(
      game_id:  params[:game_id],
      quantity: params[:quantity]
    )
    redirect_to request.referer
  end

  def destroy
    current_cart.remove_item(id: params[:id])
    flash[:notice] = "#{params[:name]} was just removed from the cart"
    redirect_to request.referer
  end
end
