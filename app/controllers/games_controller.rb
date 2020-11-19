class GamesController < ApplicationController
  def index
    @games = Game.includes(:platform).order("name ASC")
  end

  def show
    @game = Game.find(params[:id])
  end
end
