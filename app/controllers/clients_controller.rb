class ClientsController < ApplicationController
    # before_action :find_client, only: [:show]
    def show
        client = Client.find(params[:id])
        render json: client
    end

    # private
    # def find_client
    #     @client = Client.find(params[:id])
    # end
end
