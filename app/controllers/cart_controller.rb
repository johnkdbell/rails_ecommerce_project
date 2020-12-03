# class CartController < ApplicationController
#   def index

#   end

#   # POST /cart
#   # Data sent as form data (params)
#   def create
#     # Add params[:id] to cart.
#     id = params[:id].to_i
#     unless session[:shopping_cart].include?(id)
#       session[:shopping_cart] << id
#       game = Game.find(id)
#       flash[:notice] = "#{game.name} was just added to cart"
#     end
#     redirect_to request.referer
#   end

#   # DELETE /cart/:id
#   def destroy
#     # Remove params[:id] from the cart.
#     id = params[:id].to_i
#     session[:shopping_cart].delete(id)
#     game = Game.find(id)
#     flash[:notice] = "#{game.name} was just removed from the cart"
#     redirect_to request.referer
#   end

# end