class ApplicationController < ActionController::Base
  before_action :set_breadcrumbs
  before_action :initialize_session
  helper_method :cart

  def add_breadcrumbs(label, path = nil)
    @breadcrumbs << {
      label: label,
      path:  path
    }
  end

  def set_breadcrumbs
    @breadcrumbs = []
  end

  private

  def initialize_session
    session[:shopping_cart] ||= {}
  end

  def cart
    # Return a collection of Product object based on the product ids in the shopping cart
    Game.find(session[:shopping_cart])
  end

end