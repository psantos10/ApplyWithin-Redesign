class CreateLanguageLevels < ActiveRecord::Migration
  def up
    create_table :language_levels do |t|
      t.string :level

      t.timestamps null: false
    end
  end

  def down
    drop_table :language_levels
  end
end