Rails.application.routes.draw do
  get '/auth/:provider/callback', to: 'sessions#create'

  resources :sessions

  namespace :api do
    resources :users
  end
end
