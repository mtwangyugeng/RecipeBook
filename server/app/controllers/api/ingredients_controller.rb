
class Api::IngredientsController < ApplicationController
    skip_before_action :authorized, only: [:showall]

    def create
        @ingredient = Ingredient.new(
                **ingredient_params
            )
        if @ingredient.save
            render json: @ingredient.to_json
        else
            render json: {"error": "new ingredient: bad parameters"}, status: :bad_request
        end
    end

    def showall
        ingredients = Ingredient.all()
        render json: ingredients
    end

    def show
        ingredients = Ingredient.where(recipe_id: @recipe.id)
        render json: recipes, status: :ok
    end

    def create_inside_recipe
        create()
        @recipeingredientbridge = RecipeIngredientBridge.new(
                **recipe_ingredient_bridge_params,
                recipe_id: @recipe.id,
                ingredient_id: @ingredient.id
            )
        
    end


    private
        def ingredient_params
            params.permit(:name, :unit, :image_url)
        end
        def recipe_ingredient_bridge_params
            params.permit(:name, :unit, :image_url)
        end
end
