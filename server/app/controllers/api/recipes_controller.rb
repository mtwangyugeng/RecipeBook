
class Api::RecipesController < ApplicationController
    skip_before_action :authorized, only: [:index, :show]
    
    def create
        @recipe = Recipe.new(
                **recipe_params,
                user_id: @user.id,
            )
        if @recipe.save
            render json: @recipe.to_json, status: :created
        else
            render json: {"error": "new recipe: internal_server_error"}, status: :internal_server_error
        end
    end

    def index
        recipes = Recipe.all()
        render json: recipes, status: :ok
    end

    def show_user
        recipes = Recipe.where(user_id: @user.id)
        render json: recipes, status: :ok
    end

    def show
        recipe = Recipe.find(params[:id])
        render json: recipe, status: :ok
    end

    def update
        recipe = Recipe.find(params[:id])
        if recipe.update(recipe_params)
            render json: recipe, status: :accepted
        else
            render json: {"error": "update recipe: internal_server_error"}, status: :internal_server_error
        end
    end

    def destroy
        recipe = Recipe.find(params[:id])
        if recipe.destroy
            render json: {"status": :ok}, status: :ok
        else
            render json: {"status": :internal_server_error}, status: :internal_server_error
        end
    end


    private
        def recipe_params
            params.permit(:title)
        end
end
