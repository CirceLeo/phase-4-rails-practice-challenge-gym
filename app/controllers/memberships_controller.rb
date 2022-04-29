class MembershipsController < ApplicationController

    validates :gym_id, presence: true
    validates :client_id, presence: true
    validates :charge, presence: true
    validate :
    #once all running, check if we can combo these to save the 3 identical lines
    def create
        membership = Membership.create(member_params)
        render json: membership, status: :created
    end

    private
    def member_params
        params.permit(:gym_id, :client_id, :charge)
    end

    def validate_unique_membership
        test_member = Membership.find_by(gym_id: params[:gym_id], client_id: params[:client_id])
        if test_member
            render json: {error: "membership isn't unique"}, status: 422
        end
    end
end
