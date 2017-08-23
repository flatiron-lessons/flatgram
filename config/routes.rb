Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/sessions', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  resources :users, only: [:create, :show, :index, :destroy]
  resources :pictures, only: [:create, :new, :show, :index, :destroy]
  resources :comments, only: [:create, :new, :edit, :update, :destroy]
  resources :tags, only: [:create, :new, :show, :index]
  root to: 'home#welcome'
end
