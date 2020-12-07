class PageController < ApplicationController
  def index
    @pages = Page.all
  end

  def permalink
    @page = Page.find_by(permalink: params[:permalink])
    add_breadcrumbs(@page.title)
  end

  def new
    @page = Page.new
  end
end
