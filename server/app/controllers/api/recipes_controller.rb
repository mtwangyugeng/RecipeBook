class Api::RecipesController < ApplicationController
    def show
        render json: {hello: "Hi Ruby!"}
    end
end
