class Api::V1::RoleResource < JSONAPI::Resource
  attributes :name, :description, :created_at, :updated_at

  has_many :users
end