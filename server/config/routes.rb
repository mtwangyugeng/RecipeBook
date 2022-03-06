Rails.application.routes.draw do
  namespace :api do
    post "/signup", to: "users#create"
    post "/login", to: "users#login"
    get "/user", to: "users#user"

    resources :recipes do
      resources :procedures
      resources :amounts
    end
    get "/user/recipes", to: "recipes#show_user"

    resources :ingredients

  end
end
