class Api::V1::ImageResource < JSONAPI::Resource
  attributes :name, :url, :file_path, :thumbnail
  has_one :folder
end