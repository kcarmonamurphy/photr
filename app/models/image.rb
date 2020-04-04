class Image < ApplicationRecord
  include Rails.application.routes.url_helpers
  include Breadcrumbable

  has_one_attached :file
  belongs_to :folder

  validates :name, presence: true
  validates :url, uniqueness: true
  
  def url
    url_parts.join('/')
  end

  def url_parts
    if folder_path_arr.present?
      [folder_path_arr, self.name].flatten
    else
      [self.name]
    end
  end

  def file_path
    url_for self.file if self.file.attached?
  end

  def thumbnail
    url_for self.file.variant(resize: '100x100') if self.file.attached?
  end

  private

  def folder_path_arr
    self.folder.path.pluck(:name).drop(1)
  end
end