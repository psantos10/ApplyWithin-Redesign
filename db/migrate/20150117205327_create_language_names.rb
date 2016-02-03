class CreateLanguageNames < ActiveRecord::Migration
  def up
    create_table :language_names do |t|
      t.string :name

      t.timestamps null: false
    end
  end

  def down
    drop_table :language_names
  end
end
