ReviewApp::Application.routes.draw do
  
  # Site Controller
  root to: "site#index"
    
  get "/contact", to: "site#contact"

  get "/about", to: "site#about"

  
  # Animal Controller
  get '/animals', to: 'animals#index', as: :animals

  get '/animals/new', to: 'animals#new', as: :new_animal

  get '/animals/:id', to: 'animals#show', as: :animal

  get "/animals/:id/edit", to: "animals#edit", as: :edit_animal

  post '/animals', to: 'animals#create'

  patch '/animals/:id', to: 'animals#update'

end
