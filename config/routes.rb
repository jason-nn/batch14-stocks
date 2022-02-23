Rails.application.routes.draw do
  devise_for :users

  root 'pages#home'
  get '/portfolio', to: 'pages#portfolio', as: 'portfolio'
end
