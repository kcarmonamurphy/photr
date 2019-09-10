class Folder < ApplicationRecord
  has_ancestry

  has_many :images

  def url
    self.path_ids.map { |id| Folder.find(id).name }.join('/')
  end
end