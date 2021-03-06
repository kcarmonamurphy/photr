class Api::V1::ImageResource < BaseResource
  attributes :name, :url, :file_path, :thumbnail, :breadcrumbs
  has_one :folder
end