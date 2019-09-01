class Entity < ApplicationRecord
  validates :path, uniqueness: true
end