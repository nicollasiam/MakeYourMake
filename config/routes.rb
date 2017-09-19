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


  get '/institutional' => 'pages#institutional'
  get '/policy' => 'pages#policy'
  get '/term' => 'pages#term'

  devise_for :users, controllers: { registrations: 'users/registrations' }
end
