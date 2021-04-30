Rails.application.routes.draw do
  get 'label/new'
  get 'label/index'
  get 'label/edit'
  get 'label/show'
  get 'tasks/new'
  get 'tasks/show'
  get 'tasks/edit'
  get 'tasks/index'
  get 'users/new'
  get 'users/show'
  get 'users/edit'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
