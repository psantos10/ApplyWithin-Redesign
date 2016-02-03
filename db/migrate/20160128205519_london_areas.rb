class LondonAreas < ActiveRecord::Migration
  def change
    create_table :london_areas do |t|
      t.string :name
      t.string :postcode

      t.timestamps null: false
    end
  end
end

