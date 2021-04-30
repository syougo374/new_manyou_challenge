Rails.application.routes.draw do
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :labels
  resources :betweens, only:[:show]
  root to:'tasks#index'
  resources :tasks do
    collection do
      post :confirm
    end
    end


end
