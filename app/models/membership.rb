class Membership < ApplicationRecord
    belongs_to :gym
    belongs_to :client

    validates :gym_id, :client_id, :charge, presence: true

    validate :validate_unique_membership

    private

    def validate_unique_membership
        test_member = Membership.find_by(gym_id: gym_id, client_id: client_id)
        if test_member
            errors.add(:gym_id, "clients can't have 2 memberships to the same gym")
        end
    end
end
