Rails.application.routes.draw do
  resources :users
  resources :sessions, only:[:new]
  resources :tasks
  resources :labels
  resources :betweens, only:[:show]
  root to:'tasks#index'


end
