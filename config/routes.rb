Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: 'books#index'

  resources :books, only: [:index, :show]
  resources :genres


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
