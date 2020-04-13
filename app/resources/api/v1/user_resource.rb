class Api::V1::UserResource < JSONAPI::Resource
  attributes :name, :email, :created_at, :updated_at

  has_many :roles
end