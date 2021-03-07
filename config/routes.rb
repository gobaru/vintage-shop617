Rails.application.routes.draw do
  get 'shops/index'
  root to: "shops#index"
end
