class HomeController < ApplicationController
  def index
    @games = Game.includes(:platform).order("price ASC").limit(4)
    @games_sale = Game.includes(:platform).where(:on_sale => true).order("sale_price ASC").limit(4)
    @games_new = Game.includes(:platform).where(:created_at => (Date.today - 3.days)..Date.today).order("created_at DESC")
  end
end
