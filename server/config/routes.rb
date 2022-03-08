Rails.application.routes.draw do
  namespace :api do
    post "/signup", to: "users#create"
    post "/login", to: "users#login"
    get "/user", to: "users#user"

    resources :recipes
    resources :procedures, :amounts
    resources :ingredients

  end
end
