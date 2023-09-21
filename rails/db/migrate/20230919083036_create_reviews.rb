class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.references :branch, foregin_key: true
      t.references :prefecture, foregin_key: true
      t.references :city, foregin_key: true
      t.string :name, null: false
      # enum
      t.integer :gender, null: false
      t.integer :age, null: false
      t.string :address, null: false
      # enum
      t.integer :building_type, null: false
      # enum
      t.integer :times_type, null: false
      t.date :consider_season, null: false
      t.date :assesment_season, null: false
      t.date :po_season, null: false
      t.date :sale_season, null: false
      t.date :delivery_season, null: false
      t.integer :speed_cs, null: false
      t.integer :assesment_price, null: false
      t.integer :sale_price, null: false
      t.boolean :is_price_down, null: false, default: 0
      t.integer :price_down_month
      t.integer :price_down_amount
      t.integer :close_price, null: false
      t.integer :price_cs, null: false
      # enum
      t.integer :contract_type, null: false
      t.string :title, null: false
      # enum
      t.integer :sale_reason_type, null: false
      t.text :anxiety, null: false
      t.text :decision_reason, null: false
      t.integer :support_cs, null: false
      t.string :support_reason, null: false
      t.text :advice, null: false
      t.text :request

      t.timestamps
    end
  end
end
