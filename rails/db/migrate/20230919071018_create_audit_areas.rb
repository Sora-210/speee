class CreateAuditAreas < ActiveRecord::Migration[7.0]
  def change
    create_table :audit_areas do |t|

      t.timestamps
    end
  end
end
