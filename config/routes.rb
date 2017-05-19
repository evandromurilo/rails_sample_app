Rails.application.routes.draw do
  root "static_pages#home"
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/users', to: 'users#index'
  get '/settings', to: 'users#settings'
  post '/settings', to: 'users#update'
  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users
end
