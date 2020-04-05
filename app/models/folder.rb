class Folder < ApplicationRecord
  include Breadcrumbable

  has_ancestry
  has_many :images

  # at most one root folder should exist
  validates :ancestry, presence: true, unless: Proc.new { Folder.roots.count == 0 }
  validates :name, presence: true, uniqueness: {
    scope: :ancestry,
    message: 'A folder with this filename already exists in this folder.'
  }

  def url
    folder_path_arr.join('/')
  end

  def url_parts
    folder_path_arr
  end

  private

  def folder_path_arr
    self.path.pluck(:name).drop(1)
  end
end