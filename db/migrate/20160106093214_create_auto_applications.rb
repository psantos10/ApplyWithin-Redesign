class CreateAutoApplications < ActiveRecord::Migration
  def change
    create_table :auto_applications do |t|
      t.references :hunter, index: true

      t.string :location
      t.string :job_type
      t.string :status
      t.string :action

      t.timestamps null: false
    end
    add_foreign_key :auto_applications, :hunters
  end
end
