class JobWage < ActiveRecord::Migration
  def change
    create_table :job_wages do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
