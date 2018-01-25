Rails.application.routes.draw do
  devise_for :users

  root to: redirect('/products')
  get '/products', to: 'products#index'
end
