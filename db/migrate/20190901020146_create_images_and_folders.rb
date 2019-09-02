class CreateImagesAndFolders < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.string :name

      t.timestamps
    end

    create_table :folders do |t|
      t.string :name

      t.timestamps
    end
  end
end
