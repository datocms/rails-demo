Rails.application.routes.draw do
  get '/about', to: 'pages#about'
  get '/services', to: 'pages#services'
  get '/portfolio', to: 'pages#portfolio'
  get '/contact', to: 'pages#contact'
  root to: 'pages#homepage'
end
