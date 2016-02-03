class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.references :business, index: true
      
      t.string :title
      t.string :category
      t.string :bracket
      t.string :rank
      t.string :openings
      t.string :start_date

      t.string :weekly_hours
      t.string :wage
      t.string :age_restricted
      t.string :customer_facing
      t.string :dress_code
      t.string :tips

      t.text :tagline
      t.text :description
      t.text :roles_and_responsibilities
      t.text :desired_sqa

      t.datetime :deleted_at, index: true
      t.timestamps null: false
    end
    add_foreign_key :positions, :businesses
  end
end
