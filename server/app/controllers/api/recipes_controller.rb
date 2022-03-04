class Api::RecipesController < ApplicationController
    skip_before_action :authorized, only: [:showall]
    def showall
        recipes = Recipe.all()
        render json: recipes
    end

end
