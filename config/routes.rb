Rails.application.routes.draw do

  resources :teams, except: [:index]
  resources :users, only: [:index, :show]

  root "home#index"

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
