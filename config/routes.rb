Rails.application.routes.draw do
  devise_for :users

  root 'pages#home'
  get '/portfolio', to: 'pages#portfolio', as: 'portfolio'
  get '/account', to: 'pages#account', as: 'account'
  get '/blocked', to: 'pages#blocked', as: 'blocked'

  get '/transactions', to: 'transactions#index', as: 'transactions'
  get '/cashin', to: 'transactions#cashin', as: 'cashin'
  post '/cashin', to: 'transactions#cashin_post', as: 'cashin_post'
  post '/buy/:id', to: 'transactions#buy', as: 'buy'
  post '/sell/:id', to: 'transactions#sell', as: 'sell'

  get '/users', to: 'users#index', as: 'users'
  get '/pending', to: 'users#pending', as: 'pending'
  get '/users/new', to: 'users#new', as: 'new_user'
  get '/users/:id', to: 'users#show', as: 'user'
  get '/users/:id/edit', to: 'users#edit', as: 'edit_user'
  post '/users/create', to: 'users#create', as: 'create_user'
  patch '/users/:id/update', to: 'users#update', as: 'update_user'
  patch '/users/:id/approve', to: 'users#approve', as: 'approve_user'

  get '/stocks', to: 'stocks#index', as: 'stocks'
  get '/stocks/:id', to: 'stocks#show', as: 'stock'
  post '/stocks/create', to: 'stocks#create', as: 'create_stock'
  patch '/stocks/:id/update', to: 'stocks#update', as: 'update_stock'
end
