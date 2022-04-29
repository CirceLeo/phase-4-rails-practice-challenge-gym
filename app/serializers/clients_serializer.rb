class ClientsSerializer < ActiveModel::Serializer
  attributes :id, :name, :age
  has_many :memberships
  has_many :gyms

  # def total_membership_cost
  #   total = self.memberships.sum{|membership| membership.charge}
  #   "This person spends $#{total} on gyms"
  # end
end
