class CreateImpressions < ActiveRecord::Migration
  def change
    create_table :impressions do |t|
      t.string :trackable_type
      t.integer :trackable_id
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :impressions, :users
  end
end
