module CrudHelper
    extend ActiveSupport::Concern

    def create
        res = @target_model.new(
                **@target_params,
                user_id: @user.id
            )
        if res.save
            render json: res.to_json, status: :created
        else
            render json: {"error": "create: bad parameters"}, status: :bad_request
        end
    end

    def index
        res = @target_model.all()
        render json: res
    end

    def show
        res = @target_model.find(params[:id])
        render json: res, status: :ok
    end

    def update
        res = @target_model.find(params[:id])
        if res.update(@target_params)
            render json: res, status: :accepted
        else
            render json: {"error": "update: internal_server_error"}, status: :internal_server_error
        end
    end

    def destroy
        res = @target_model.find(params[:id])
        if res.destroy
            render json: {"success": "Deleted"}, status: :see_other
        else
            render json: {"status": :internal_server_error}, status: :internal_server_error
        end
    end
end