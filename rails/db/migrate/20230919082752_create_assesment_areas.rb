# frozen_string_literal: true

class CreateAssesmentAreas < ActiveRecord::Migration[7.0]
  def change
    create_table :assesment_areas do |t|
      t.references :branch, forgin_key: true
      t.references :city, forgin_key: true
      t.timestamps
    end
  end
end
