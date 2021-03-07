Rails.application.routes.draw do
  devise_for :users
  get 'shops/index'
  root to: "shops#index"
end
