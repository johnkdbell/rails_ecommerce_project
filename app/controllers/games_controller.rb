class GamesController < ApplicationController
  def index
    @games = Game.includes(:platform).order("name ASC").page(params[:page])
  end

  def show
    @game = Game.find(params[:id])
  end
end
