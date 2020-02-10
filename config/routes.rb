Rails.application.routes.draw do
  get 'welcome/index'
  root 'welcome#index'
  devise_for :users
  resources :posts
  resources :users, only: [:index, :show]
end
