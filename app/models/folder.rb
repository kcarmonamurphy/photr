class Folder < ApplicationRecord
  has_ancestry

  has_many :images

  before_save :update_url

  private

  def url
    self.path_ids.map { |id| Folder.find(id).name }.join('/')
  end

  def update_url
    self.url = url if self.ancestry_changed?
  end
end