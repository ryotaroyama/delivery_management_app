Rails.application.routes.draw do
  root "customers#index"
  resources :customers, only: [:index]
  resources :products, only: [:create, :edit, :show, :destroy]
end
