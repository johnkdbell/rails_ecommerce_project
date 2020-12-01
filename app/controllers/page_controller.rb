class PageController < ApplicationController
  before_action :set_page, only: [:show]

  def index
    @pages = Page.all
  end

  def show
  end

  def new
    @page = Page.new
  end
end
