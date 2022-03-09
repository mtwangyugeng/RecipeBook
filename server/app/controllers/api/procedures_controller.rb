class Api::ProceduresController < ApplicationController
    skip_before_action :authorized, only: [:index, :show]
    include CrudHelper

    def initialize
        @target_model = Procedure
    end

    before_action :setup_param, only: [:create, :update]
    def setup_param
        @target_params = procedure_params
    end

    private
        def procedure_params
            params.permit(:content, :recipe_id)
        end
end
