Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :games, only: [:index, :show] do
    collection do
      get "search"
    end
  end

  resources :platforms, only: [:index, :show] do
    collection do
      get "search"
    end
  end

  root to: "home#index"

end
