Rails.application.routes.draw do

  get 'user/new', to: 'users#new'
  post 'user/new', to: 'users#create'
  get 'user/:id(.:format)', to: 'users#show'
  
  get  '/login',  to: 'sessions#new'
  post '/login',  to: 'sessions#create'
  delete  '/logout', to: 'sessions#destroy'
  get    '/signup',  to: 'users#new'
  post   '/signup',  to: 'users#create'

  resources :users
  resources :events
end
