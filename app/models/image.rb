class Image < ApplicationRecord
  has_one_attached :file

  belongs_to :folder, optional: true
  
  def url
    if self.folder.present?
      [folder_path, self.name].join('/')
    else
      self.name
    end
  end

  private

  def folder_path
    self.folder.path_ids.map { |id| Folder.find(id).name }.join('/')
  end
end