Rails.application.routes.draw do
  resources :categories
  resources :articles
  root to: "articles#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  #root "folders#index"

  get "/folders/search", to: "folders#search"
  resources :folders
end
