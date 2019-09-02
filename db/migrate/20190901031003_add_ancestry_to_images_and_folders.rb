class AddAncestryToImagesAndFolders < ActiveRecord::Migration[5.2]
  def change
    add_column :images, :ancestry, :string
    add_index :images, :ancestry

    add_column :folders, :ancestry, :string
    add_index :folders, :ancestry
  end
end
