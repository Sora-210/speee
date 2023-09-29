# frozen_string_literal: true

class CreateAssessments < ActiveRecord::Migration[7.0]
  def change
    create_table :assessments do |t|
      t.references :branch, forgin_key: true
      t.references :prefecture, forgin_key: true
      t.references :city, forgin_key: true
      t.string :last_name, null: false
      t.string :first_name, null: false
      t.string :last_name_kana, null: false
      t.string :first_name_kana, null: false
      t.string :tel, null: false
      t.string :email, null: false
      t.string :address, null: false
      t.integer :building_type, null: false
      t.integer :exclusive_area, null: false
      t.integer :land_area, null: false
      t.integer :building_area, null: false
      t.integer :room_plan_type, null: false
      t.integer :constructed_year, null: false

      t.timestamps
    end
  end
end
