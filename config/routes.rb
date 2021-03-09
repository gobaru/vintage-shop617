Rails.application.routes.draw do
  devise_for :users
  get 'shops/index'
  root to: 'shops#index'
  resources :shops do
    resources :comments, only: [:create]
  end
  resources :users, only: [:show]
end
