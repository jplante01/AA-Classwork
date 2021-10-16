Rails.application.routes.draw do

  resource :sessions, only: [:new, :create, :destroy]
  resources :goals, only: [:create, :destroy]
  resources :users, only: [:new, :create, :show, :index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
