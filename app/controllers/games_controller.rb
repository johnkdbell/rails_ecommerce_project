class GamesController < ApplicationController
  def index
    @games = Game.includes(:platform).order("name ASC").page(params[:page])
    add_breadcrumbs("Games")
  end

  def show
    @game = Game.find(params[:id])
    add_breadcrumbs("Games", games_path)
    add_breadcrumbs(@game.name)
  end
end
