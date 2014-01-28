MiniRoutes::Application.routes.draw do
  resources :urls, :users, :sessions
  
  # get "sessions/new"
  # get "sessions/destroy"
  # get "users/new"
  # get "users/show"
  # get "users/create"
  

  root to: 'urls#index' 

  get '/small/', to: 'urls#small', as: :small

  get '/signup' => 'users#new'
  delete '/signout', to: 'sessions#destroy', via: :delete
  get'/signin' => 'sessions#new'

  # get '/urls/:id/preview', to: 'urls#preview', as: :preview

  # get '/urls/:id', to: 'uls#final', as: :final


end
