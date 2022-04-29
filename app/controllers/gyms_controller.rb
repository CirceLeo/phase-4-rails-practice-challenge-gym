class GymsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
    before_action :find_gym, only: [:show, :delete, :update]

    def show
        render json: @gym
    end

    def index
        render json: Gym.all
    end

    def update
        @gym.update(gym_params)
        render json: @gym, status: :accepted
    end

    def destroy
        if @gym
            @gym.destroy
            render json: {}, status: :accepted
        else
            render json: {error: "Gym not found"}, status: 404
        end
        # head :no_content
    end

    private
    def find_gym
        Gym.find(params[:id])
    end

    def gym_params
        params.permit(:name, :address)
    end
    
    def render_not_found
        render json: {error: "Gym not found"}, status: 404
    end
end
