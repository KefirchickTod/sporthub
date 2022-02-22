require "sidekiq/web"
# require "sidekiq/cron/web"

Rails.application.routes.draw do
  mount Sidekiq::Web => "/sidekiq"

  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    # Admin pies of site
    # Define all routes for admin here
    namespace :admin do
      resources :articles
      resources :categories
      resources :users, except: %i[new create]
      resources :teams
      resources :surveys
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
    resources :articles
    resource :user_team, only: %i[edit update show]
    delete "/user_teams/:id/delete", to: "user_teams#destroy", as: "user_team_delete"
    post "/answer", to: "surveys#create", as: "answer"
  end
end
