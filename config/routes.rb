Rails.application.routes.draw do
  
  get '/login', to: 'sessions#new'
  post '/sessions', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/signup', to: 'users#new', as: 'signup'

  # added these below #
  resources :likes, only: [:create, :new, :destroy]
  # end added code #
 
  resources :users, only: [:create, :show, :index, :destroy]
  resources :pictures, only: [:create, :new, :show, :index, :destroy]
  resources :comments, only: [:create, :new, :edit, :update, :destroy]
  resources :tags, only: [:create, :new, :show, :index]
  root to: 'home#welcome'
end
