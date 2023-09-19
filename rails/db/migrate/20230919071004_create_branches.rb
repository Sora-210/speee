class CreateBranches < ActiveRecord::Migration[7.0]
  def change
    create_table :branches do |t|
      t.references :companies, forgin_key: true
      t.string :name, null: false
      t.string :logo_url, null: false
      t.string :post_code, null: false
      t.references :prefectures, forgin_key: true
      t.references :cities, forgin_key: false
      t.string :address, null: false
      t.string :phone
      t.string :fax
      t.string :business_hours
      t.string :holidays
      t.string :catchcopy, null: false
      t.string :introduction, null: false
    end
  end
end
