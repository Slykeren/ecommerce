Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: 'books#index'
  get "books/:id", to: "books#show"

  get 'orders/show'
  get 'orders/index'
  get 'genres/index'
  get 'genres/show'
  get 'books/index'
  get 'books/show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
