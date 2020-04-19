class Api::V1::UserResource < BaseResource
  attributes :name, :email, :created_at, :updated_at

  has_many :roles
end