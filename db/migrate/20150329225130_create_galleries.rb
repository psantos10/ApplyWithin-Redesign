class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.references :business, index: true

      t.timestamps null: false
    end
    add_foreign_key :galleries, :businesses
  end
end
