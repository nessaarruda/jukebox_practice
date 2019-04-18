Rails.application.routes.draw do
  root to: 'welcome#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :users, only: [:new, :create, :show]

  resources :carts, only: [:create]
  resources :orders, only: [:create]

  resources :songs, only: [:index, :new, :create, :edit, :update]

  resources :songs, only: [:index, :show]

  namespace :admin do
    resources :categories, only: [:index]
  end
end
