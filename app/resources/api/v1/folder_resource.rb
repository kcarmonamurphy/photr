class Api::V1::FolderResource < BaseResource
  attributes :name, :url, :breadcrumbs
  has_many :images

  # ancestry
  relationship :subtree, to: :many, eager_load_on_include: false, class_name: "Folder"
  relationship :children, to: :many, eager_load_on_include: false, class_name: "Folder"
  relationship :parent, to: :one, always_include_linkage_data: true, eager_load_on_include: false, class_name: "Folder"
end