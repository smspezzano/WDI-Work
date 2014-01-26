MiniRoutes::Application.routes.draw do
  
  resources :urls

  root to: 'urls#index' 

  # get '/urls/:id/preview', to: 'urls#preview', as: :preview

  # get '/urls/:id', to: 'uls#final', as: :final


end
