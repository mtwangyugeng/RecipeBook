
class Api::RecipesController < ApplicationController
    skip_before_action :authorized, only: [:index, :show]
    
    include CrudHelper

    def initialize
        @target_model = Recipe
    end

    before_action :setup_param, only: [:create, :update]
    def setup_param
        @target_params = recipe_params
    end


    private
        def recipe_params
            params.permit(:title)
        end
end
