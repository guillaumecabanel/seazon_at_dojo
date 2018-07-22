Rails.application.routes.draw do
  devise_for :users
  root controller: :pages, action: :home
  resources :meals, only: [:index, :new, :create, :edit, :update, :destroy]
end
