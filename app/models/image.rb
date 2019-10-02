class Image < ApplicationRecord
  include Rails.application.routes.url_helpers

  has_one_attached :file

  belongs_to :folder, optional: true
  
  def url
    if self.folder.present?
      [folder_path, self.name].join('/')
    else
      self.name
    end
  end

  def file_path
    url_for self.file if self.file.attached?
  end

  def thumbnail
    url_for self.file.variant(resize: '100x100') if self.file.attached?
  end

  private

  def folder_path
    self.folder.path_ids.map { |id| Folder.find(id).name }.join('/')
  end
end