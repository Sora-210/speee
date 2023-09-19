class CreateAssesmentAreas < ActiveRecord::Migration[7.0]
  def change
    create_table :assesment_areas do |t|
      t.references :branches, forgin_key: true
      t.references :cities, forgin_key: true
    end
  end
end
