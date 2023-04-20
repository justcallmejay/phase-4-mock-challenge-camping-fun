class ActivitySerializer < ActiveModel::Serializer
  attributes :id, :name, :difficulty

  has_many :signups, Serializer: SignupSerializer
  # has_many :campers, through: :signups
end
