class AddUniqueIndexToFolders < ActiveRecord::Migration[5.2]
  def change
    add_index :folders, [:name, :ancestry], unique: true
  end
end
