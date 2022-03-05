
class Api::RecipesController < ApplicationController
    skip_before_action :authorized, only: [:showall]
    def showall
        recipes = Recipe.all()
        render json: recipes
    end

    def create
        neo = Recipe.new(
                **recipe_params,
                user_id: @user.id,
            )
        if neo.save
            render json: neo.to_json
        else
            render json: {"error": "new recipe: bad parameters"}, status: :bad_request
        end
    end

    def show
        recipes = Recipe.where(user_id: @user.id)
        render json: recipes, status: :ok
    end

    private
        def recipe_params
            params.permit(:title)
        end
end
