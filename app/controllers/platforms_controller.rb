class PlatformsController < ApplicationController
  def index
    @platforms = Platform.all.page(params[:page])
  end

  def show
    @platform = Platform.find(params[:id])
  end
end
