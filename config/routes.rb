Rails.application.routes.draw do
  devise_for :users
  root controller: :servings, action: :index

  namespace :admin do
    resources :meals,    only: [:index, :new, :create, :edit, :update, :destroy]
    resources :payments, only: [:create, :destroy], param: :order_id
    resources :orders,   only: [:index]
    resources :servings, only: [:new, :create, :edit, :update, :destroy]
  end

  resources :servings, only: [:index] do
    resources :orders, only: [:new, :create]
  end

  resources :orders, only: [:index]

  resource :profile, only: [:edit, :update]
end
