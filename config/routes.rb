Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root to: 'makes#index'

  namespace :profile do
    resources :users, only: :show
    resources :makes, except: :show
    resources :liked_makes, only: [:index, :create, :destroy]
  end

  resources :makes, only: [:index, :show] do
    resources :images, only: [:new, :create]
    resources :reviews, only: :create
  end

  resources :types, only: :show


  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
