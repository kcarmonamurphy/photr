class AddAncestryToEntities < ActiveRecord::Migration[5.2]
  def change
    add_column :entities, :ancestry, :string
    add_index :entities, :ancestry
  end
end
