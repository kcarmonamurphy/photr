class AddUniqueIndexToImages < ActiveRecord::Migration[5.2]
  def change
    add_index :images, [:name, :folder_id], unique: true
  end
end
