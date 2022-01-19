Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"

  resource :user, only: %i[create new]

  resources :confirmations, only: %i[create edit new], param: :confirmation_token
  resources :sessions, only: %i[create new]
  get "logout", to: "sessions#destroy"
end
