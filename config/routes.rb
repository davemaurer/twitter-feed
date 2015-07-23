Rails.application.routes.draw do
  root 'welcome#index'

  get '/auth/twitter', as: :login

  get '/auth/twitter/callback', to: 'sessions#create'

  resources :tweets, only: [:create, :new]

  resources :dashboard, only: [:index]

  get '/logout', as: :logout, to: 'sessions#destroy'
end
