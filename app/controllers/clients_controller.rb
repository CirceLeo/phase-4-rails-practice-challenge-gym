class ClientsController < ApplicationController
    before_action :find_client, only: [:show, :update]
    def show
        render json: @client, methods: :total_membership_cost
    end

    def index
        render json: Client.all
    end

    def update
        @client.update(client_params)
        render json: @client, status: :accepted
    end

    private
    def find_client
        @client = Client.find(params[:id])
    end

    def client_params
        params.permit(:name, :age)
    end
end
