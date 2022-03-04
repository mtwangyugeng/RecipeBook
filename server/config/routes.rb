Rails.application.routes.draw do
  namespace :api do
    post "/signup", to: "users#create"
    post "/login", to: "users#login"
    get "/user", to: "users#user"
    get '/recipes', to: 'recipes#showall'
  end
end
