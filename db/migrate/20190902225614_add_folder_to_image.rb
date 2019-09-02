class AddFolderToImage < ActiveRecord::Migration[5.2]
  def change
    add_reference :images, :folder, foreign_key: true
  end
end
