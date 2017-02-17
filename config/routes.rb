Rails.application.routes.draw do
  devise_for :users

  resources :users
  resources :user_favorites
  root 'static#home'

  resource :last_fms, only: [:show]

end
