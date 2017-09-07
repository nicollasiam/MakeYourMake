Rails.application.routes.draw do
  get 'images/new'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root to: 'makes#index'

  namespace :profile do
    resources :makes, except: :show
  end

  resources :makes, only: [:index, :show] do
    resources :images, only: [:new, :create]
  end

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
