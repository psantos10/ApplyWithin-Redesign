class CreatePositionApplications < ActiveRecord::Migration
  def change
    create_table :position_applications do |t|
      t.references :hunter, index: true
      t.references :position_advertisement, index: true

      t.datetime :rejected_at
      t.datetime :cancelled_at

      t.timestamps null: false
      t.datetime :deleted_at, index: true
    end
    add_foreign_key :position_applications, :hunters
    add_foreign_key :position_applications, :position_advertisements
  end
end

