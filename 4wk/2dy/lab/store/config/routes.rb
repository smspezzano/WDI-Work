Store::Application.routes.draw do
  resources :categories, :products

  root 'stores#index'

  delete 'products/:id', to: 'products#destroy', as: :destroy_product
end
