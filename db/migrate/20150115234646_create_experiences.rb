class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.references :hunter, index: true

      t.string :job_title
      t.string :job_category

      t.string :employer
      t.string :location

      t.date :start_date
      t.date :end_date

      t.text :tagline
      t.text :job_description
      t.text :roles_and_responsibilities
      t.text :personal_comment

      t.string :current_role
      t.string :customer_facing

      t.timestamps null: false
    end
    add_foreign_key :experiences, :hunters
  end
end
