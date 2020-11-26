class GamesController < ApplicationController
  def index
    @games = Game.includes(:platform).order("name ASC").page(params[:page])
    @games_sale = Game.includes(:platform).where(:on_sale => true).order("sale_price ASC")
    @games_new = Game.includes(:platform).where(:created_at => (Date.today - 3.days)..Date.today).order("created_at DESC")
    add_breadcrumbs("Games")
  end

  def show
    @game = Game.find(params[:id])
    add_breadcrumbs("Games", games_path)
    add_breadcrumbs(@game.name)
  end

  def sales
    @games_sale = Game.includes(:platform).where(:on_sale => true).order("sale_price ASC").page(params[:page])
    add_breadcrumbs("Games", games_path)
    add_breadcrumbs("Sales")
	end

	def new
    @games_new = Game.includes(:platform).where(:created_at => (Date.today - 3.days)..Date.today).order("created_at DESC").page(params[:page])
  end

end
