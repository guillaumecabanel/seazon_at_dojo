Rails.application.routes.draw do
  devise_for :users
  root controller: :pages, action: :home
  resources :meals,    only: [:index, :new, :create, :edit, :update, :destroy]
  resources :servings, only: [:index, :new, :create, :edit, :update, :destroy]
  resources :orders,   only: [:index, :new, :create]
  resources :payments, only: [:create, :destroy], param: :order_id
end
