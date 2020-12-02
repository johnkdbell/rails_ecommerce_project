class ApplicationController < ActionController::Base
  before_action :set_breadcrumbs
  before_action :initialize_session
  before_action :current_cart
  helper_method :cart
  protect_from_forgery with: :exception

  def current_cart
    @current_cart ||= ShoppingCart.new(token: cart_token)
  end
  helper_method :current_cart

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

  def cart_token
    return @cart_token unless @cart_token.nil?

    session[:cart_token] ||= SecureRandom.hex(8)
    @cart_token = session[:cart_token]
  end

end