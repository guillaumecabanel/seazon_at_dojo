Rails.application.routes.draw do
  devise_for :users
  root controller: :pages, action: :home
end
