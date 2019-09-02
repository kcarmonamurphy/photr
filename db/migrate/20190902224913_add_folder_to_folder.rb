class AddFolderToFolder < ActiveRecord::Migration[5.2]
  def change
    add_reference :folders, :folder, foreign_key: true
  end
end
