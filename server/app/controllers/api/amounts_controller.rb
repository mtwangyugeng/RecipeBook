class Api::AmountsController < ApplicationController
    include CrudHelper

    def initialize
        @target_model = Amount
    end

    before_action :setup_param, only: [:create, :update]
    def setup_param
        @target_params = amount_params
    end

    private
        def amount_params
            params.permit(:amount, :ingredient_id, :recipe_id)
        end
end
