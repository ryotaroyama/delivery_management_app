Rails.application.routes.draw do
  root "customers#index"
  resources :customers, only: [:index]
  resources :products, only: [:show, :new, :create, :edit, :destroy]
end
