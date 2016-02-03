class WeeklyHours < ActiveRecord::Migration
  def change
    create_table :weekly_hours do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
