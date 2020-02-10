Rails.application.routes.draw do
  get 'welcome/index'
  root 'welcome#index'
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :posts
  resources :users, only: [:index, :show]
end
