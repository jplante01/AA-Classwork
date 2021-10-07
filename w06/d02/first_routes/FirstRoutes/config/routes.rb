Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # resources :users

  get '/users', to: 'users#index'
  get '/users/new', to: 'users#new'
  get '/users/:id', to: 'users#show'
  post '/users', to: 'users#create'
  delete '/users/:id', to: 'users#destroy'
  patch '/users/:id', to: 'users#update'
  get '/users/:id/edit', to: 'users#edit'
  put '/users/:id', to: 'users#update'

end
