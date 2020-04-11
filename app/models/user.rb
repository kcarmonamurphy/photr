class User < ApplicationRecord
  has_secure_password

  has_many :access_grants,
           class_name: 'Doorkeeper::AccessGrant',
           foreign_key: :resource_owner_id,
           dependent: :destroy

  has_and_belongs_to_many :roles
end
