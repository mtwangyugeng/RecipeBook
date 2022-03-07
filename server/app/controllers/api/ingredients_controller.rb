
class Api::IngredientsController < ApplicationController
    skip_before_action :authorized, only: [:index]

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

    def index
        ingredients = Ingredient.all()
        render json: ingredients
    end

    def show
        ingredients = Ingredient.where(recipe_id: @recipe.id)
        render json: recipes, status: :ok
    end

    def create_inside_recipe
        create()
        recipe_id = params[:recipe_id]
        @amount = Amount.new(
                **amount_params,
                recipe_id: recipe_id,
                ingredient_id: @ingredient.id
            )
        
    end


    private
        def ingredient_params
            params.permit(:name, :image_url)
        end
        def amount_params
            params.permit(:amount)
        end
end
