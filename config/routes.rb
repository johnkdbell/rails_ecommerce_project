Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :games, only: %i[index show new_arrivals sales] do
    collection do
      get "search"
      get "new-arrivals"
      get "sales"
    end
  end

  resources :platforms, only: %i[index show] do
    collection do
      get "search"
    end
  end

  resources :cart, only: %i[index create destroy]

  resources :page, except: [:show]

  get ":permalink" => "page#permalink"

  root to: "home#index"

end
