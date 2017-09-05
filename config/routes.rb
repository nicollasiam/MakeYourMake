Rails.application.routes.draw do

  namespace :profile do
    get 'makes/index'
  end

  namespace :profile do
    get 'makes/show'
  end

  namespace :profile do
    get 'makes/edit'
  end

  namespace :profile do
    get 'makes/new'
  end

  root to: 'makes#index'


  resources :images, only: [:new, :create]
  resources :makes

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
