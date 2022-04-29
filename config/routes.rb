Rails.application.routes.draw do
  get 'upload/view'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "/admin", to: "admin#index"
  get "/login_otp", to: "login#view"
  post "/login_otp", to: "login#verify"
  get "/otp_yubico", to: "admin#otp"
  get "/upload_page", to: "upload#view"
  # Defines the root path route ("/")
  # root "articles#index"
end
