class AddColumnIsPublic < ActiveRecord::Migration[7.0]
  def up
    add_column :reviews, :is_public, :boolean, default: true, null: false
  end

  def down
    remove_column :reviews, :is_public, :boolean
  end
end
