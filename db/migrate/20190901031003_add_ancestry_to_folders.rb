class AddAncestryToFolders < ActiveRecord::Migration[5.2]
  def change
    add_column :folders, :ancestry, :string
    add_index :folders, :ancestry
  end
end
