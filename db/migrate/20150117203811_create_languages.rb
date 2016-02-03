class CreateLanguages < ActiveRecord::Migration
  def change
    create_table :languages do |t|
      t.references :hunter, index: true
      t.string :name
      t.string :level

      t.string :spoken_level
      t.string :written_level
      t.string :reading_level

      t.text :comment

      t.timestamps null: false
    end
    add_foreign_key :languages, :hunters
  end
end
