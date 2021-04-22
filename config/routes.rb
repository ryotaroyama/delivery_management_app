Rails.application.routes.draw do
  root "orders#index"
  resources :orders, only: [:index, :show, :new, :create, :edit, :destroy]
  get "/drawing_numbers/search_number", to: "drawing_numbers#search_number"
end
