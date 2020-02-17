class Api::V1::ImageResource < JSONAPI::Resource
  attributes :name, :url, :file_path, :thumbnail, :breadcrumbs
  has_one :folder
end