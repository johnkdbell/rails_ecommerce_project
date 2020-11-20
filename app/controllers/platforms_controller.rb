class PlatformsController < ApplicationController
  def index
    @platforms = Platform.all.page(params[:page])
    add_breadcrumbs("Platforms")

  end

  def show
    @platform = Platform.find(params[:id])
    add_breadcrumbs("Platforms", games_path)
    add_breadcrumbs(@platform.name)
  end
end
