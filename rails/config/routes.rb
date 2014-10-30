Rails.application.routes.draw do
  get '/auth/:provider/callback', to: 'sessions#create'

  namespace :api do
    resources :users
    resources :sessions
  end
end
