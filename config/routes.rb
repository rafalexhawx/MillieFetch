Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "folders#index"

  get "/folders/search", to: "folders#search"
  get "/folders/cart", to: "folders#cart"
  get 'folders/add_to_cart/:id', to:'folders#add_to_cart', as: 'add_to_cart'
  get 'folders/remove_from_cart/:id', to: 'folders#remove_from_cart', as: 'remove_from_cart'
  
  
  resources :folders
end
