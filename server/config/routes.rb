Rails.application.routes.draw do
  namespace :api do
    post "/signup", to: "users#create"
    post "/login", to: "users#login"
    get "/user", to: "users#user"
    get '/recipes', to: 'recipes#showall'
    post "/createrecipe", to: "recipes#create"
    get "/userrecipes", to: "recipes#show"
    post "/addingredient", to: "ingredients#create"
  end
end
