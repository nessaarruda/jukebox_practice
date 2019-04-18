Rails.application.routes.draw do
  root to: 'welcome#index'

  resources :users, only: [:new, :create, :show]

  resources :carts, only: [:create]
  resources :orders, only: [:create]

  resources :artists, only: [:index, :show, :new, :create] do
    resources :songs, only: [:index, :new, :create, :edit, :update]
  end

  resources :songs, only: [:index, :show]

  namespace :admin do
    resources :categories, only: [:index]
  end
end
