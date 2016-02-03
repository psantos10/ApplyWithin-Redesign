class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.references :gallery, index: true

      t.timestamps null: false
    end
    add_foreign_key :photos, :galleries
    add_attachment :photos, :file
  end
end
