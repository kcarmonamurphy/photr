class Entity < ApplicationRecord
  has_ancestry

  has_one_attached :file

  def url
    self.path_ids.map { |id| Entity.find(id).name }.join('/')
  end
end