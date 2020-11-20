class ApplicationController < ActionController::Base
  before_action :set_breadcrumbs

  def add_breadcrumbs(label, path = nil)
    @breadcrumbs << {
      label: label,
      path: path
    }
  end

  def set_breadcrumbs
    @breadcrumbs = []
  end
end
