class CreateBranches < ActiveRecord::Migration[7.0]
  def change
    create_table :branches do |t|
      t.references :companies, forgin_key: true
      t.references :prefectures, forgin_key: true
      t.references :cities, forgin_key: false
      t.string :name, null: false
      t.string :logo_url, null: false
      t.string :post_code, null: false
      t.string :address, null: false
      t.string :phone
      t.string :fax
      t.string :business_hours_text, comment: '営業時間 <ex: 平日9:00-18:00>'
      t.string :holidays, comment: '<ex: 水曜日、祝日>'
      t.string :catchcopy, null: false
      t.string :introduction, null: false
    end
  end
end
