Rails.application.routes.draw do
  get 'users/update'

  get 'users/destroy'

  devise_for :users

  root to: 'users#index'

  resources :users
end
