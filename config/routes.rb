Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: "omniauth_callbacks",
  }
  root "orders#index"
  resources :orders, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resource :display_orders, only: [:create, :destroy]
  end
  get "/drawing_numbers/search_number", to: "drawing_numbers#search_number"
end
