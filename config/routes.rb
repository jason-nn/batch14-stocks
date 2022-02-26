Rails.application.routes.draw do
  devise_for :users

  root 'pages#home'
  get '/portfolio', to: 'pages#portfolio', as: 'portfolio'
  get '/account', to: 'pages#account', as: 'account'

  get '/transactions', to: 'transactions#index', as: 'transactions'
  post '/cashin', to: 'transactions#cashin', as: 'cashin'
  post '/buy', to: 'transactions#buy', as: 'buy'
  post '/sell', to: 'transactions#sell', as: 'sell'

  get '/users', to: 'users#index', as: 'users'
  get '/users/:id', to: 'users#show', as: 'user'
  get '/users/new', to: 'users#new', as: 'new_user'
  get '/users/:id/edit', to: 'users#edit', as: 'edit_user'
  post '/users/create', to: 'users#create', as: 'create_user'
  patch '/users/:id/update', to: 'users#update', as: 'update_user'
  patch '/users/:id/approve', to: 'users#approve', as: 'approve_user'

  get '/stocks', to: 'stocks#index', as: 'stocks'
  post '/stocks/create', to: 'stocks#create', as: 'create_stock'
  patch '/stocks/:id/update', to: 'stocks#update', as: 'update_stock'
end
