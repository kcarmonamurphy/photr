class Api::V1::FolderResource < JSONAPI::Resource
  attributes :name, :url
  has_many :images
end