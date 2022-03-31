Rails.application.routes.draw do
  # resources :categories
  # resources :articles

  get 'about', to: 'folders#about'
  get "/folders/search", to: "folders#search"

  post 'folders/add_to_cart/:id', to:'folders#add_to_cart', as: 'add_to_cart'
  delete 'folders/remove_from_cart/:id', to: 'folders#remove_from_cart', as: 'remove_from_cart'
  # root to: "articles#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "folders#index"

  resources :folders
end
