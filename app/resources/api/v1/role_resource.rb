class Api::V1::RoleResource < BaseResource
  attributes :name, :description, :created_at, :updated_at

  has_many :users
end