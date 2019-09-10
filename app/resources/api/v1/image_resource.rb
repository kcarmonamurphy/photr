class Api::V1::ImageResource < JSONAPI::Resource
  attributes :name, :url
  has_one :folder
end