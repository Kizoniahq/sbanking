Rails.application.routes.draw do

  resources :cards
resources :contacts, only: [:new, :create]
  resources :accounts do
    resources :transfers
    resources :deposits
  end
  resources :transfers do
    resources :otps
  end
  resources :transactions, only: [:index]
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :pages, only: [:show]
  authenticated :user do
    root 'accounts#index', as: "authenticated_root"
  end
    root "welcome#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
