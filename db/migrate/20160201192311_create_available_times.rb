class CreateAvailableTimes < ActiveRecord::Migration
  def change
    create_table :available_times do |t|
      t.string :morning, default: '1'
      t.string :afternoon, default: '1'
      t.string :evening, default: '1'
      t.string :late, default: '0'
      t.string :day
      t.references :hunter, index: true

      t.timestamps null: false
    end
    add_foreign_key :available_times, :hunters
  end
end
