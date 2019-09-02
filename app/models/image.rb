class Image < ApplicationRecord
  has_one_attached :file

  belongs_to :folder

  # has_ancestry
  
  def url
    self.path_ids.map { |id| image.find(id).name }.join('/')
  end
end