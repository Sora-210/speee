# frozen_string_literal: true

class AddColumnIsPublic < ActiveRecord::Migration[7.0]
  def change
    add_column :reviews, :is_public, :boolean, default: true, null: false
  end
end
