class Folder < ApplicationRecord
  has_ancestry
  has_many :images

  # at most one root folder should exist
  validates :ancestry, presence: true, if: Proc.new { Folder.roots.count > 0 }
  validates :name, presence: true

  def url
    self.path.map { |folder| folder.name }.drop(1).join('/')
  end
end