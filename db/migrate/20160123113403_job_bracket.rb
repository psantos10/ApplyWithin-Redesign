class JobBracket < ActiveRecord::Migration
  def change
    create_table :job_brackets do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
