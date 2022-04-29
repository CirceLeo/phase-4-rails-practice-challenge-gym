class ApplicationController < ActionController::API
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
    # rescue_from ActiveRecord::UnprocessableEntity, with: render_bad_data
    private

    def render_not_found
        render json: {error: "Sorry, I can't find that"}, status: 404
    end

    # def render_bad_data invalid
    #     render json: {errors: invalid.record.errors.full_messages}, status: 422
    # end
end
