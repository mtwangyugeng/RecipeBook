class Api::IngredientsController < ApplicationController
    skip_before_action :authorized, only: [:index, :show]
    include CrudHelper

    def initialize
        @target_model = Ingredient
    end

    before_action :setup_param, only: [:create, :update]
    def setup_param
        @target_params = ingredient_params
    end

    private
        def ingredient_params
            params.permit(:name, :unit, :best_market, :common_price, :common_quantity)
        end
end
