class CreateEducations < ActiveRecord::Migration
  def change
    create_table :educations do |t|
      t.references :hunter, index: true

      t.string :institution
      t.string :qualification
      t.string :subject
      t.string :result

      t.date :start_date
      t.date :end_date

      t.text :comment

      t.timestamps null: false
    end
    add_foreign_key :educations, :hunters
  end
end
