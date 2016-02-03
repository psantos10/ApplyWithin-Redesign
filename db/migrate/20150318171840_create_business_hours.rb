class CreateBusinessHours < ActiveRecord::Migration
  def change
    create_table :business_hours do |t|
      t.time :opens_at
      t.time :closes_at
      t.string :day
      t.references :business, index: true

      t.timestamps null: false
    end
    add_foreign_key :business_hours, :businesses
  end
end
