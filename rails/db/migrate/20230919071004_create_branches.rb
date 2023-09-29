# frozen_string_literal: true

class CreateBranches < ActiveRecord::Migration[7.0]
  def change
    create_table :branches do |t|
      t.references :company, forgin_key: true
      t.references :prefecture, forgin_key: true
      t.references :city, forgin_key: false
      t.string :name
      t.string :logo_url, null: false
      t.string :post_code, null: false
      t.string :address, null: false
      t.string :tel
      t.string :fax
      t.string :business_hours_text, comment: '営業時間 <ex: 平日9:00-18:00>'
      t.string :holidays_text, comment: '<ex: 水曜日、祝日>'
      t.string :catchcopy, null: false
      t.text :introduction, null: false
      t.timestamps
    end
  end
end
