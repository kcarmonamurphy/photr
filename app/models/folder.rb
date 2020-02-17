class Folder < ApplicationRecord
  has_ancestry
  has_many :images

  # at most one root folder should exist
  validates :ancestry, presence: true, if: Proc.new { Folder.roots.count > 0 }
  validates :name, presence: true

  def url
    folder_path_arr.join('/')
  end

  private

  def folder_path_arr
    self.path.pluck(:name).drop(1)
  end
end