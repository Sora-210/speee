class CreateCities < ActiveRecord::Migration[7.0]
  def change
    create_table :cities do |t|
      t.string :name, null: false
      t.string :yomi, null: false

      t.references :prefectures, forgin_key: true
    end
  end
end
