class HomeController < ApplicationController
  def index
    @games = Game.includes(:platform).order("price ASC").limit(5)
  end
end
