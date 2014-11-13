Rails.application.routes.draw do
  get '/auth/:provider/callback', to: 'sessions#create'

  resources :sessions

  namespace :api do
    resource :status, only: [:show]
    resources :users
    resources :activities
    resources :youtube_subscriptions
    resources :subscriptions
    resources :subscription_activities

    # externally facing API
    namespace :v1 do
      resources :activities, only: [:index]
      resources :users, only: [:show, :index] do
        resources :activities, only: [:index], controller: 'users/activities'
      end
    end
  end
end
