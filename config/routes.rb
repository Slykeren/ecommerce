Rails.application.routes.draw do
  
  resources :users, only: [:new, :create]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'welcome', to: 'sessions#welcome'
  get 'authorized', to: 'sessions#page_requires_login'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: 'books#index'

  resources :books, only: [:index, :show]
  resources :genres


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
