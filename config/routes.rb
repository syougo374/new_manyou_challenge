Rails.application.routes.draw do
  resources :users, only: [:index, :new, :create, :edit, :update, :show]
  resources :sessions, only: [:new, :create, :destroy]
  # resources :labels
  # resources :betweens, only: [:create, :destroy, :show]
  root to:'tasks#index'
  resources :tasks do
    collection do
      post :confirm
    end
    end

end
