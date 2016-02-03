class CreateBusinesses < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
      t.references :user
      t.string :name
      t.string :business_type

      t.string :address
      t.string :postcode
      t.string :city
      t.string :phone
      t.string :website

      t.string :facebook
      t.string :google_plus
      t.string :instagram
      t.string :twitter

      t.text :tagline
      t.text :about

      t.float :latitude
      t.float :longitude

      t.timestamps null: false

    end

    add_attachment :businesses, :cover_image

  end
end
