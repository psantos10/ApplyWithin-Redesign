class CreateHunters < ActiveRecord::Migration
  def change
    create_table :hunters do |t|
      t.references :user

      t.string :first_name
      t.string :last_name

      t.date :dob
      t.string :nationality
      t.string :location
      t.string :phone

      t.string :seeking
      t.string :tagline
      t.string :driving_licence

      t.text :summary
      t.text :interests
      t.text :teamwork
      t.text :communication
      t.text :customer_service
      t.text :responsibility

      t.timestamps null: false

    end

    add_attachment :hunters, :avatar
    add_attachment :hunters, :cover_photo
  end
end
