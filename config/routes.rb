Rails.application.routes.draw do
  devise_for :users

  root to: redirect('/products')
  get '/products', to: 'products#index'
  post '/items', to: 'items#create'
  get '/cart', to: 'carts#show', as: 'cart'
  get '/checkout', to: 'orders#new', as: 'checkout'
  post '/orders', to: 'orders#create'
end
