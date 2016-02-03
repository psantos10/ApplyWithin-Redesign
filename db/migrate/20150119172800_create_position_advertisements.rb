class CreatePositionAdvertisements < ActiveRecord::Migration
  def change
    create_table :position_advertisements do |t|
      t.references :position, index: true
      t.date :start_date
      t.date :end_date

      t.datetime :closed_at
      t.datetime :deleted_at

      t.timestamps null: false
      t.datetime :deleted_at, index: true
    end
    add_foreign_key :position_advertisements, :positions
  end
end

