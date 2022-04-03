class Api::ListItemsController < ApplicationController
    include CrudHelper

    def initialize
        @target_model = ListItem
    end

    before_action :setup_param, only: [:create, :update]
    def setup_param
        @target_params = list_item_params
    end

    private
        def list_item_params
            params.permit(:amount, :ingredient_id)
        end
end
