class HomeController < ApplicationController
  def index
    @games = Game.includes(:platform).order("price ASC").limit(4)
    @games_sale = Game.includes(:platform).where(:on_sale => true).order("sale_price ASC").limit(4)
    @games_new = Game.includes(:platform).where('created_at >= ?', Time.now-3.days).order("created_at DESC").limit(4)
  end
end
