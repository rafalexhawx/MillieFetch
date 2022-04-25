Rails.application.routes.draw do
  get 'uploads/index', to: 'uploads#index'
  get 'uploads/new'
  get 'uploads/create'
  get 'uploads/destroy'
  post "uploads/new"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :uploads, only: [:index, :new, :create, :destroy]   
  # root "uploads#index" 
  root "folders#index"

  get "/folders/search", to: "folders#search"
  resources :folders
end
