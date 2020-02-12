Rails.application.routes.draw do
  root 'welcome#index'
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :posts
  resources :users, only: [:index, :show]

  resources :chats do
    resources :messages
  end
end
