Rails.application.routes.draw do
  namespace :api do
    get '/recipes', to: 'recipes#show'
  end
end
