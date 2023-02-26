Rails.application.routes.draw do
  get 'receipt/index', to: "receipt#index"
  get '/multiform/index', to: "multiform#index"
  post '/multiform/index', to: "multiform#create", as: 'submit_multiupload'
  get "/uploads/index", to: "uploads#index"
  get "/uploads/new", to: "uploads#new"
  post "/uploads", to: "uploads#create"
  post "/multiuploads", to: "multiupload#create"
  get "/uploads/series", to: "multiupload#index"
  #get '/uploads/destroy'
  #post "/uploads/new"
  #get '/upload/view'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "/admin", to: "admin#index"
  get '/admin/logoff', to: 'admin#logoff', as: "logoff"
  get "/login_otp", to: "login#view"
  post "/login_otp", to: "login#verify"
  get "/otp_yubico", to: "admin#otp"
  get "/upload_page", to: "upload#view"
  # Defines the root path route ("/")
  # root "articles#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :uploads, only: [:index, :new, :create, :destroy]   
  resources :multiuploads, only: [:index, :new, :create, :destroy]  
  resources :multiform, only: [:index, :new, :create, :destroy]
  resources :receipt, only: [:index]
  # root "uploads#index" 
  root "folders#index"

  get "/folders/search", to: "folders#search"
  get "/folders/cart", to: "folders#cart"
  get "folders/add_to_cart/:id", to:"folders#add_to_cart", as: "add_to_cart"
  get "/folders/display_url", to: "folders#display_url"
  # get 'folders/remove_from_cart/:id', to: 'folders#remove_from_cart', as: 'remove_from_cart'
  match 'folders/remove_from_cart/:id' => 'folders#remove_from_cart', as: 'remove_from_cart', :via => [:get, :delete]
  
  
  resources :folders
  resources :cart
  resources :id
end
