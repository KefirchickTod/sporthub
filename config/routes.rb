Rails.application.routes.draw do

  # Admin pies of site
  # Define all routes for admin here
  namespace :admin do
    resources :articles
    resources :categories
    resources :users, except: %i[new create]
  end

  # Sig up and sign in in site routes
  namespace :authentication do
    resource :registration, only: %i[create new], as: "register"
    resources :confirmations, only: %i[create edit new], param: :confirmation_token
    resources :sessions, only: %i[create new], as: "login"
    get "logout", to: "sessions#destroy", as: "logout"
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"

  # resource :user, only: %i[create new]

  # Site info routes

  resource :users, except: %i[new create]


end
