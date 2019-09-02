class Folder < ApplicationRecord
  has_ancestry

  has_many :images
end