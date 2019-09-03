class AddUrlToFolder < ActiveRecord::Migration[5.2]
  def change
    add_column :folders, :url, :string
  end
end
