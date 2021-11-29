Rails.application.routes.draw do
  
  get 'cart/show'
  resources :users, only: [:new, :create]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'welcome', to: 'sessions#welcome'
  get 'authorized', to: 'sessions#page_requires_login'
  delete 'logout', to: 'sessions#destroy'
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: 'books#index'

  post 'books/add_to_cart/:id', to: 'books#add_to_cart', as: 'add_to_cart'
  delete 'products/remove_from_cart/:id', to: 'books#remove_from_cart', as: 'remove_from_cart'
  post 'carts/add_quantity/:id', to: 'carts#add_quantity', as: 'add_quantity'
  post 'carts/remove_quantity/:id', to: 'carts#remove_quantity', as: 'remove_quantity'




  resources :books, only: [:index, :show]
  resources :genres
  resources :orders
  resources :order_items
  resource :cart, only: [:show]


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
