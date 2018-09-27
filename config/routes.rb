Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  root controller: :servings, action: :index

  namespace :admin do
    resources :meals,    only: [:index, :new, :create, :edit, :update, :destroy]
    resources :orders,   only: [:index]
    resources :payments, only: [:create, :destroy], param: :order_id
    resources :servings, only: [:new, :create, :edit, :update, :destroy]
    resource :statistics, only: [:show]
  end

  resources :servings, only: [:index] do
    resources :orders, only: [:new, :create]
  end

  resources :orders, only: [:index, :update]

  resource :preferences, only: [:edit, :update]
end
