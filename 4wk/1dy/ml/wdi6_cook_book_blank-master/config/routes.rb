CookBook::Application.routes.draw do
  resources :books, :recipes, :ingredients, :users, :sessions

  root to: 'books#index'

  get '/signup' => 'users#new'
  delete '/signout', to: 'sessions#destroy'
  get'/signin' => 'sessions#new'

end

