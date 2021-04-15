Rails.application.routes.draw do
  root "orders#index"
  resources :orders, only: [:index, :show, :new, :create, :edit, :destroy]
  get "/products/search_number", to: "products#search_number"
end
