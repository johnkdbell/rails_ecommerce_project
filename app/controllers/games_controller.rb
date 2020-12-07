class GamesController < ApplicationController
  def index
    @games = Game.includes(:platform).order("name ASC").page(params[:page])
    @games_sale = Game.includes(:platform).where(on_sale: true).order("sale_price ASC")
    @games_new = Game.includes(:platform)
                     .where("created_at >= ?", Time.zone.now - 3.days).order("created_at DESC")
    add_breadcrumbs("Games")
  end

  def show
    @game = Game.find(params[:id])
    add_breadcrumbs("Games", games_path)
    add_breadcrumbs(@game.name)
  end

  def sales
    @games_sale = Game.includes(:platform).where(on_sale: true)
                      .order("sale_price ASC").page(params[:page])
    add_breadcrumbs("Games", games_path)
    add_breadcrumbs("Sales")
  end

  def new_arrivals
    @games_new = Game.includes(:platform)
                     .where("created_at >= ?", Time.zone.now - 3.days)
                     .order("created_at DESC").page(params[:page])
    add_breadcrumbs("Games", games_path)
    add_breadcrumbs("New")
  end

  def search
    @game_platforms = Platform.all
    wildcard_search = "%#{params[:keywords]}%"
    platform_search = params[:platform].to_s

    @platform = Platform.find_by(title: platform_search)

    @games = Game.all

    @platform ? @count = Game.joins(:platform).where("platform_id = ?", @platform.id).where("name LIKE ?", wildcard_search.downcase) : @count = Game.joins(:platform).where("name LIKE ?", wildcard_search.downcase)
    @platform ? @games = Game.joins(:platform).where("platform_id = ?", @platform.id).where("name LIKE ?", wildcard_search.downcase).page(params[:page]) : @games = Game.joins(:platform).where("name LIKE ?", wildcard_search.downcase)
  end
end
