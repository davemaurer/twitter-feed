Rails.application.routes.draw do
  root 'welcome#index'

  get '/auth/twitter', as: :login

  get '/auth/twitter/callback', to: 'sessions#create'

  resources :dashboard, only: [:index, :show]

  get '/logout', as: :logout, to: 'sessions#destroy'
end
