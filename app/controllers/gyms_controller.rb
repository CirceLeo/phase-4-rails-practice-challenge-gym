class GymsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
    before_action :find_gym, only: [:show, :delete]

    def show
        render json: @gym
    end

    def destroy
        @gym.destroy
        # head :no_content
        render json: {}, status: :accepted
    end

    private
    def find_gym
        @gym = Gym.find(params[:id])
    end
    
    def render_not_found
        render json: {error: "Gym not found"}, status: 404
    end
end
