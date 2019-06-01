Rails.application.routes.draw do
  root 'user#show'
  get 'user/new'
  post 'user/new', to: 'user#create'
  get 'user/show'
  
  get  '/login',  to: 'session#new'
  post '/login',  to: 'session#create'
  delete  '/logout', to: 'session#destroy'

end
