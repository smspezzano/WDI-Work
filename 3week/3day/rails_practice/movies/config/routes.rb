Movies::Application.routes.draw do
  root 'movies#index'

  get 'movies/new' => 'movies#new', as: :new_movie

  get 'movies/show' => 'movies#show', as: :movie

  get 'movies/:id/edit' => 'movies#edit', as: :edit_movie
  
  patch 'movies/:id' => 'movies#update'

  delete 'movies/:id' => 'movies#destroy'

end
