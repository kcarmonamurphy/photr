class Folder < ApplicationRecord
  has_ancestry

  has_many :images

  def url
    self.path.map { |folder| folder.name }.drop(1).join('/')
  end
end