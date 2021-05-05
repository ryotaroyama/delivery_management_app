Rails.application.routes.draw do
  root "orders#index"
  resources :orders, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resource :display_orders, only: [:create, :destroy]
  end
  get "/drawing_numbers/search_number", to: "drawing_numbers#search_number"
end
