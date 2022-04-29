class Client < ApplicationRecord
    has_many :memberships, dependent: :destroy
    has_many :gyms, through: :memberships

    def total_membership_cost
        total = self.memberships.sum{|membership| membership.charge}
        "This person spends $#{total} on gyms"
    end
end
