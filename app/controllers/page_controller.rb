class PageController < ApplicationController

  def index
    @pages = Page.all
  end

  def permalink
    @page = Page.find_by(permalink: params[:permalink])
    add_breadcrumbs("Games", games_path)
    add_breadcrumbs(@game.name)
  end

  def new
    @page = Page.new
  end
end
