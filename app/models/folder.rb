class Folder < ApplicationRecord
  has_ancestry

  has_many :images
  has_many :folders
end