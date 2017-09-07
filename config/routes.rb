Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root to: 'makes#index'

  namespace :profile do
    resources :makes
  end

  resources :makes, only: [:index, :show]

  # DELETE?
  resources :images, only: [:new, :create]

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
