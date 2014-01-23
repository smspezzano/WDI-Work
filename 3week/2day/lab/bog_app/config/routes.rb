BogApp::Application.routes.draw do
  get "/", to: "creatures#home"

  get "/creatures", to: "creatures#index"

  get "/creatures/new", to: "creatures#new"

  post "/creatures", to: "creatures#create"

  get "/creatures/:id/edit", to: "creatures#edit"

  get "/creatures/:id", to: "creatures#show"

  put "/creatures/:id", to: "creatures#update"

  get "/creatures/:id/delete", to: "creatures#delete"

end
