class Folder < ApplicationRecord
  has_ancestry
  has_many :images

  # at most one root folder should exist
  validates :ancestry, presence: true, if: Proc.new { Folder.roots.count > 0 }
  validates :name, presence: true

  def url
    folder_path_arr.join('/')
  end

  def url_parts
    folder_path_arr
  end

  def breadcrumbs
    url_parts.map.with_index do |_, index|
      a = url_parts[0..index].inject({url: [], name: nil}) do |memo, value|
        memo[:url] << value
        memo[:name] = value
        memo
      end
      a[:url] = a[:url].join('/')
      a
    end
  end

  private

  def folder_path_arr
    self.path.pluck(:name).drop(1)
  end
end